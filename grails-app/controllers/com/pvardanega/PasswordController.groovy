package com.pvardanega

import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class PasswordController {

    def springSecurityService

    static allowedMethods = [update: "POST"]

    def edit() {
        User loggedInUser = springSecurityService.currentUser as User
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        if (loggedInUser.isAdmin() || loggedInUser == userInstance) {
            [userInstance: userInstance]
        } else {
            actionNotAllowed(loggedInUser)
        }
    }

    def update() {
        User loggedInUser = springSecurityService.currentUser as User
        def userInstance = User.get(params.id)

        if (!loggedInUser.isAdmin() && loggedInUser != userInstance) {
            actionNotAllowed(loggedInUser)
        }

        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'user.label', default: 'User')] as Object[],
                        "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        if (params.password != params.confirmation) {
            userInstance.errors.rejectValue("password", "user.error.password.confirmation.different")
            userInstance.errors.rejectValue("confirmation", "user.error.password.confirmation.different")
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect controller: 'product', action: 'list', params: [userId: userInstance.id]
    }

    def actionNotAllowed(def userInstance) {
        redirect(controller: 'product', action: 'list', params: [userId: userInstance.id])
        return
    }
}
