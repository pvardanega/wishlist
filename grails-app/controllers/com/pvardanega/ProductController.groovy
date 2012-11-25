package com.pvardanega

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_FULLY'])
class ProductController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        User loggedInUser = springSecurityService.currentUser as User
        User user = User.findById(params.userId)
        def myList = loggedInUser == user

        def products
        if (myList) {
            products = Product.findAllByOwnerAndCreatedBy(user, loggedInUser)
        } else {
            products = Product.findAllByOwnerAndCreatedByInList(user, [user, loggedInUser])
        }
        [products: products, productsTotal: products.size(), myList: myList, me: loggedInUser,
                messageType: params.messageType]
    }

    def create() {
        [productInstance: new Product(params)]
    }

    def save() {
        def productInstance = new Product(params)
        productInstance.createdBy = springSecurityService.currentUser as User;
        if (!productInstance?.link?.startsWith("http://") && !productInstance?.link?.startsWith("https://")) {
            productInstance?.link = "http://" + productInstance?.link
        }
        if (!productInstance.save(flush: true)) {
            render(view: "create", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.created.message')
        redirect(action: "list", params: [userId: productInstance.owner.id])
    }

    def edit() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def update() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product.label', default: 'Product')] as Object[],
                          "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }

        productInstance.properties = params

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.updated.message')
        redirect(action: "list", params: [userId: productInstance.owner.id])
    }

    def delete() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list", params: [userId: productInstance.owner.id])
            return
        }

        try {
            productInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list", params: [userId: productInstance.owner.id])
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def offerBy() {
        def product = Product.get(params.id)

        if (product.offeredBy) {
            flash.message = message(code: 'product.already.reserved', args: [product?.offeredBy?.toString()])
            redirect(action: "list", params: [userId: product.owner.id, messageType: "block"])
            return
        }

        product.offeredBy = springSecurityService.currentUser as User;

        if (!product.save(flush: true)) {
            flash.message = message(code: 'default.error.message')
            redirect(action: "list", params: [userId: product.owner.id, messageType: "error"])
            return
        }

        flash.message = message(code: 'default.updated.message')
        redirect(action: "list", params: [userId: product.owner.id])
    }

    def release() {
        def product = Product.get(params.id)

        product.offeredBy = null;

        if (!product.save(flush: true)) {
            flash.message = message(code: 'default.error.message')
            redirect(action: "list", params: [userId: product.owner.id])
            return
        }

        flash.message = message(code: 'default.updated.message')
        redirect(action: "list", params: [userId: product.owner.id])
    }
}
