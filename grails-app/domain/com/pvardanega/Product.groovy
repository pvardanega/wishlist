package com.pvardanega

class Product {

    String title

    static belongsTo = [owner: User]

    static constraints = {
        title blank: false
        owner nullable: false
    }
}
