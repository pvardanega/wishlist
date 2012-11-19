package com.pvardanega

import grails.plugins.springsecurity.SpringSecurityService
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.junit.Test

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

        assert "/product/list?userId=${user.id}" == response.redirectedUrl
    }
}
