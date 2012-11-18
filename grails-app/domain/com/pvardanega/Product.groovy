package com.pvardanega

class Product {

    String title
    String pictureUrl
    Double price
    String link
    String description

    static belongsTo = [owner: User]

    static constraints = {
        title blank: false, maxSize: 256
        description blank: false, maxSize: 2048
        pictureUrl nullable: true
        price nullable: true
        link nullable: true
        owner nullable: false

    }
}
