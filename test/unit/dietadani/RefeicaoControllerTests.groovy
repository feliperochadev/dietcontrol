package dietadani



import org.junit.*
import grails.test.mixin.*

@TestFor(RefeicaoController)
@Mock(Refeicao)
class RefeicaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/refeicao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.refeicaoInstanceList.size() == 0
        assert model.refeicaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.refeicaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.refeicaoInstance != null
        assert view == '/refeicao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/refeicao/show/1'
        assert controller.flash.message != null
        assert Refeicao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/refeicao/list'

        populateValidParams(params)
        def refeicao = new Refeicao(params)

        assert refeicao.save() != null

        params.id = refeicao.id

        def model = controller.show()

        assert model.refeicaoInstance == refeicao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/refeicao/list'

        populateValidParams(params)
        def refeicao = new Refeicao(params)

        assert refeicao.save() != null

        params.id = refeicao.id

        def model = controller.edit()

        assert model.refeicaoInstance == refeicao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/refeicao/list'

        response.reset()

        populateValidParams(params)
        def refeicao = new Refeicao(params)

        assert refeicao.save() != null

        // test invalid parameters in update
        params.id = refeicao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/refeicao/edit"
        assert model.refeicaoInstance != null

        refeicao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/refeicao/show/$refeicao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        refeicao.clearErrors()

        populateValidParams(params)
        params.id = refeicao.id
        params.version = -1
        controller.update()

        assert view == "/refeicao/edit"
        assert model.refeicaoInstance != null
        assert model.refeicaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/refeicao/list'

        response.reset()

        populateValidParams(params)
        def refeicao = new Refeicao(params)

        assert refeicao.save() != null
        assert Refeicao.count() == 1

        params.id = refeicao.id

        controller.delete()

        assert Refeicao.count() == 0
        assert Refeicao.get(refeicao.id) == null
        assert response.redirectedUrl == '/refeicao/list'
    }
}
