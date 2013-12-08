package dietadani

import org.springframework.dao.DataIntegrityViolationException

class RefeicaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [refeicaoInstanceList: Refeicao.list(params), refeicaoInstanceTotal: Refeicao.count()]
    }

    def create() {
        [refeicaoInstance: new Refeicao(params)]
    }

    def save() {
        def refeicaoInstance = new Refeicao(params)
        if (!refeicaoInstance.save(flush: true)) {
            render(view: "create", model: [refeicaoInstance: refeicaoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'refeicao.label', default: 'Refeicao'), refeicaoInstance.id])
        redirect(action: "show", id: refeicaoInstance.id)
    }

    def show(Long id) {
        def refeicaoInstance = Refeicao.get(id)
        if (!refeicaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refeicao.label', default: 'Refeicao'), id])
            redirect(action: "list")
            return
        }

        [refeicaoInstance: refeicaoInstance]
    }

    def edit(Long id) {
        def refeicaoInstance = Refeicao.get(id)
        if (!refeicaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refeicao.label', default: 'Refeicao'), id])
            redirect(action: "list")
            return
        }

        [refeicaoInstance: refeicaoInstance]
    }

    def update(Long id, Long version) {
        def refeicaoInstance = Refeicao.get(id)
        if (!refeicaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refeicao.label', default: 'Refeicao'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (refeicaoInstance.version > version) {
                refeicaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'refeicao.label', default: 'Refeicao')] as Object[],
                        "Another user has updated this Refeicao while you were editing")
                render(view: "edit", model: [refeicaoInstance: refeicaoInstance])
                return
            }
        }

        refeicaoInstance.properties = params

        if (!refeicaoInstance.save(flush: true)) {
            render(view: "edit", model: [refeicaoInstance: refeicaoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'refeicao.label', default: 'Refeicao'), refeicaoInstance.id])
        redirect(action: "show", id: refeicaoInstance.id)
    }

    def delete(Long id) {
        def refeicaoInstance = Refeicao.get(id)
        if (!refeicaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refeicao.label', default: 'Refeicao'), id])
            redirect(action: "list")
            return
        }

        try {
            refeicaoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'refeicao.label', default: 'Refeicao'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'refeicao.label', default: 'Refeicao'), id])
            redirect(action: "show", id: id)
        }
    }
}
