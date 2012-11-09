package com.pvardanega

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.GrailsMock
import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(HomeController)
@Mock(User)
class HomeControllerTests {

    @Test
    void should_redirect_to_users_list_if_admin() {

        User user = new User()
        def mock = mockFor(SpringSecurityService)
        mock.demand.getCurrentUser { -> user }
        controller.springSecurityService = mock.createMock()

        Role admin = new Role(authority: "ROLE_ADMIN")
        UserRole userRole = new UserRole()
        userRole.user = user
        userRole.role = admin

        def mockUserRole = new GrailsMock(UserRole)
        mockUserRole.demand.static.findAllByUser(1..1) { User u -> [userRole] }

        def mockRole = new GrailsMock(Role)
        mockRole.demand.static.findByAuthority(1..1) { r -> admin }

        controller.index()

        assert "/user" == response.redirectedUrl
    }

    @Test
    void should_redirect_to_user_show_view_if_not_admin() {

        User user = new User()
        user.id = 1L
        def mock = mockFor(SpringSecurityService)
        mock.demand.getCurrentUser { -> user }
        controller.springSecurityService = mock.createMock()

        def mockUserRole = new GrailsMock(UserRole)
        mockUserRole.demand.static.findAllByUser(1..1) { User u -> [] }

        def mockRole = new GrailsMock(Role)
        mockRole.demand.static.findByAuthority(1..1) { r -> new Role(authority: "ROLE_USER") }

        controller.index()

        assert "/user/show/${user.id}" == response.redirectedUrl
    }
}
