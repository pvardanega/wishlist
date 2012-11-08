package com.pvardanega

import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class HomeController {

    def index() {
        if (sec.ifAllGranted(roles: "ROLE_ADMIN")) {
            redirect controller: 'user'
        } else {
            redirect controller: 'user', action: 'show', id: sec.loggedInUserInfo(field: 'id')
        }
    }
}
