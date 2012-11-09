package com.pvardanega

import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class HomeController {

    def springSecurityService

    def index() {
        User loggedInUser = springSecurityService.currentUser as User

        if (loggedInUser.isAdmin()) {
            redirect controller: 'user'
        } else {
            redirect controller: 'user', action: 'show', id: loggedInUser.id
        }
    }
}
