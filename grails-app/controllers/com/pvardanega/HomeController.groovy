package com.pvardanega

import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class HomeController {

    def springSecurityService

    def index() {
        UserAccount loggedInUser = springSecurityService.currentUser as UserAccount
        redirect controller: 'product', action: 'list', params: [userId: loggedInUser.id]
    }
}
