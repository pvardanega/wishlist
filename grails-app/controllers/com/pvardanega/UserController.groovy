package com.pvardanega

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_FULLY'])
class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list")
    }

    @Secured(['ROLE_ADMIN'])
    def list() {
        [userInstanceList: User.list(), userInstanceTotal: User.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [userInstance: new User(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def userInstance = new User(params)

        if (params.password != params.confirmation) {
            flash.message = message(code: 'user.error.password.confirmation.different')
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        userInstance.enabled = true
        userInstance.username = userInstance.firstname?.capitalize() +
                                " " +
                                userInstance.lastname?.charAt(0)?.toUpperCase() +
                                "."

        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        UserRole.create userInstance, Role.findByAuthority("ROLE_USER"), true

		flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def show() {
        def userInstance = User.get(params.id)
        if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit() {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update() {
        def userInstance = User.get(params.id)

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
            flash.message = message(code: 'user.error.password.confirmation.different')
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        params.username = userInstance.firstname?.capitalize() + " " + userInstance.lastname?.charAt(0)?.toUpperCase() + "."
        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect controller: 'product', action: 'list', params: [userId: userInstance.id]
    }

    def delete() {
        def userInstance = User.get(params.id)
        if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        try {
            UserRole.removeAll(userInstance)
            userInstance.delete(flush: true)
            redirect(controller: 'logout')
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect controller: 'product', action: 'list', params: [userId: userInstance.id]
        }
    }
}
