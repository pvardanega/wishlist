package com.pvardanega

import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class HomeController {

    def springSecurityService

    def index() {
        User loggedInUser = springSecurityService.currentUser as User
        redirect controller: 'product', action: 'list', params: [userId: loggedInUser.id]
    }
}
