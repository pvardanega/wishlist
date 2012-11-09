package com.pvardanega

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.GrailsMock
import grails.test.mixin.*
import org.junit.Ignore

@TestFor(UserController)
@Mock(User)
class UserControllerTests {

    def populateValidParams(params) {
        assert params != null
        params["firstname"] = 'firstname'
        params["lastname"] = 'lastname'
        params["password"] = 'password'
        params["confirmation"] = 'password'
        params["email"] = 'test@yopmail.com'
        params["username"] = 'Firstname L.'
    }

    void testIndex() {
        controller.index()
        assert "/user/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userInstanceList.size() == 0
        assert model.userInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.userInstance != null
    }

    @Ignore
    void testSave() {
        controller.save()

        assert model.userInstance != null
        assert view == '/user/create'

        response.reset()

        populateValidParams(params)

        controller.save()

        assert response.redirectedUrl == '/user/show/1'
        assert controller.flash.message != null
        assert User.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'

        populateValidParams(params)
        def user = new User(params)

        assert user.save() != null

        params.id = user.id

        def model = controller.show()

        assert model.userInstance == user
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'


        populateValidParams(params)
        def user = new User(params)

        assert user.save() != null

        params.id = user.id

        def model = controller.edit()

        assert model.userInstance == user
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'

        response.reset()


        populateValidParams(params)

        def user = new User(params)

        def mockSpringSecurityService = new GrailsMock(SpringSecurityService)
        mockSpringSecurityService.demand.encodePassword(2..2) { password -> password }
        user.springSecurityService = mockSpringSecurityService.createMock()

        assert user.save() != null

        // test invalid parameters in update
        params.id = user.id
        params.email = null

        controller.update()

        assert view == "/user/edit"
        assert model.userInstance != null

    }

    void test_update2() {
        populateValidParams(params)
        def user = new User(params)

        def mockSpringSecurityService = new GrailsMock(SpringSecurityService)
        mockSpringSecurityService.demand.encodePassword(2..2) { password -> password }
        user.springSecurityService = mockSpringSecurityService.createMock()

        assert user.save() != null
        params.id = user.id

        controller.update()

        assert response.redirectedUrl == "/user/show/$user.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        user.clearErrors()

        populateValidParams(params)
        params.id = user.id
        params.version = -1
        controller.update()

        assert view == "/user/edit"
        assert model.userInstance != null
        assert model.userInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/user/list'

        response.reset()

        populateValidParams(params)

        def user = new User(params)

        def mockSpringSecurityService = new GrailsMock(SpringSecurityService)
        mockSpringSecurityService.demand.encodePassword() { password -> password }
        user.springSecurityService = mockSpringSecurityService.createMock()

        assert user.save() != null
        assert User.count() == 1

        params.id = user.id

        def mockUserRole = new GrailsMock(UserRole)
        mockUserRole.demand.static.removeAll() { User param -> }

        controller.delete()

        assert User.count() == 0
        assert User.get(user.id) == null
        assert response.redirectedUrl == '/user/list'
    }
}
