package dietadani



import org.junit.*
import grails.test.mixin.*

@TestFor(AlimentoController)
@Mock(Alimento)
class AlimentoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/alimento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.alimentoInstanceList.size() == 0
        assert model.alimentoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.alimentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.alimentoInstance != null
        assert view == '/alimento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/alimento/show/1'
        assert controller.flash.message != null
        assert Alimento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/alimento/list'

        populateValidParams(params)
        def alimento = new Alimento(params)

        assert alimento.save() != null

        params.id = alimento.id

        def model = controller.show()

        assert model.alimentoInstance == alimento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/alimento/list'

        populateValidParams(params)
        def alimento = new Alimento(params)

        assert alimento.save() != null

        params.id = alimento.id

        def model = controller.edit()

        assert model.alimentoInstance == alimento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/alimento/list'

        response.reset()

        populateValidParams(params)
        def alimento = new Alimento(params)

        assert alimento.save() != null

        // test invalid parameters in update
        params.id = alimento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/alimento/edit"
        assert model.alimentoInstance != null

        alimento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/alimento/show/$alimento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        alimento.clearErrors()

        populateValidParams(params)
        params.id = alimento.id
        params.version = -1
        controller.update()

        assert view == "/alimento/edit"
        assert model.alimentoInstance != null
        assert model.alimentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/alimento/list'

        response.reset()

        populateValidParams(params)
        def alimento = new Alimento(params)

        assert alimento.save() != null
        assert Alimento.count() == 1

        params.id = alimento.id

        controller.delete()

        assert Alimento.count() == 0
        assert Alimento.get(alimento.id) == null
        assert response.redirectedUrl == '/alimento/list'
    }
}
