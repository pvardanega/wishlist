package com.pvardanega

class Product {

    String title

    static belongsTo = [owner: User]

    static constraints = {
        title blank: false, maxSize: 256
        owner nullable: false
    }
}
