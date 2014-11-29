package com.pvardanega

class Product {

    String title
    String pictureUrl
    Double price
    String link
    String description

    static belongsTo = [owner: UserAccount, createdBy: UserAccount, offeredBy: UserAccount]

    static constraints = {
        title blank: false, maxSize: 256
        description nullable: true, maxSize: 2048
        pictureUrl nullable: true
        price nullable: true
        link nullable: true
        owner nullable: false
        offeredBy nullable: true
    }
}
