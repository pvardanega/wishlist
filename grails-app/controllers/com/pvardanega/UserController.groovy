package com.pvardanega

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_FULLY'])
class UserController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list")
    }

    @Secured(['ROLE_ADMIN'])
    def list() {
        [userInstanceList: UserAccount.list(), userInstanceTotal: UserAccount.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [userInstance: new UserAccount(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def userInstance = new UserAccount(params)

        if (params.password != params.confirmation) {
            userInstance.errors.rejectValue("password", "user.error.password.confirmation.different")
            userInstance.errors.rejectValue("confirmation", "user.error.password.confirmation.different")
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        userInstance.enabled = true

        if (params?.firstname && params?.lastname) {
            userInstance.username = userInstance?.firstname?.capitalize() + " " + userInstance?.lastname?.charAt(0)?.toUpperCase() + "."
        }

        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        UserRole.create userInstance, Role.findByAuthority(Role.ROLE_USER), true

		flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "list")
    }

    def edit() {
        UserAccount loggedInUser = springSecurityService.currentUser as UserAccount
        def userInstance = UserAccount.get(params.id)

        if (!loggedInUser.isAdmin() && loggedInUser != userInstance) {
            actionNotAllowed(loggedInUser)
        }

        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update() {
        UserAccount loggedInUser = springSecurityService.currentUser as UserAccount
        def userInstance = UserAccount.get(params.id)

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

        if (params?.firstname && params?.lastname) {
            params.username = params?.firstname?.capitalize() + " " + params?.lastname?.charAt(0)?.toUpperCase() + "."
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        if (userInstance.id == loggedInUser.id) {
            springSecurityService.reauthenticate userInstance.email
        }
		flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect controller: 'product', action: 'list', params: [userId: userInstance.id]
    }

    def delete() {
        UserAccount loggedInUser = springSecurityService.currentUser as UserAccount
        def userInstance = UserAccount.get(params.id)

        if (!loggedInUser.isAdmin() && loggedInUser != userInstance) {
            actionNotAllowed(loggedInUser)
        }

        if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        try {
            UserRole.removeAll(userInstance)
            userInstance.delete(flush: true)
            if (params.id == loggedInUser.id) {
                redirect(controller: 'logout')
            } else {
                if (loggedInUser.isAdmin()) {
                    redirect(action: 'list')
                } else {
                    redirect(controller: 'home')
                }
            }
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect controller: 'product', action: 'list', params: [userId: userInstance.id]
        }
    }

    def actionNotAllowed(def userInstance) {
        redirect(controller: 'product', action: 'list', params: [userId: userInstance.id])
        return
    }
}