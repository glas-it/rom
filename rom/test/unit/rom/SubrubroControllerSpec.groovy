package rom



import grails.test.mixin.*
import spock.lang.*

@TestFor(SubrubroController)
@Mock(Subrubro)
class SubrubroControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.subrubroInstanceList
            model.subrubroInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.subrubroInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def subrubro = new Subrubro()
            subrubro.validate()
            controller.save(subrubro)

        then:"The create view is rendered again with the correct model"
            model.subrubroInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            subrubro = new Subrubro(params)

            controller.save(subrubro)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/subrubro/show/1'
            controller.flash.message != null
            Subrubro.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def subrubro = new Subrubro(params)
            controller.show(subrubro)

        then:"A model is populated containing the domain instance"
            model.subrubroInstance == subrubro
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def subrubro = new Subrubro(params)
            controller.edit(subrubro)

        then:"A model is populated containing the domain instance"
            model.subrubroInstance == subrubro
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/subrubro/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def subrubro = new Subrubro()
            subrubro.validate()
            controller.update(subrubro)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.subrubroInstance == subrubro

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            subrubro = new Subrubro(params).save(flush: true)
            controller.update(subrubro)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/subrubro/show/$subrubro.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/subrubro/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def subrubro = new Subrubro(params).save(flush: true)

        then:"It exists"
            Subrubro.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(subrubro)

        then:"The instance is deleted"
            Subrubro.count() == 0
            response.redirectedUrl == '/subrubro/index'
            flash.message != null
    }
}
