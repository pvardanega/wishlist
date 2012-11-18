package com.pvardanega

class Product {

    String title

    static hasMany = [users: User]

    static constraints = {
        title blank: false
    }
}
