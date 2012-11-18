package com.pvardanega

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.junit.Test

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(HomeController)
@Mock(User)
class HomeControllerTests {

    @Test
    void should_redirect_to_user_show_view() {

        User user = new User()
        user.id = 1L
        def mock = mockFor(SpringSecurityService)
        mock.demand.getCurrentUser { -> user }
        controller.springSecurityService = mock.createMock()

        controller.index()

        assert "/user/show/${user.id}" == response.redirectedUrl
    }
}
