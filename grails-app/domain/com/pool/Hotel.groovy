package com.pool

class Hotel {
    String name
    Country country
    int stars
    URL link

    static belongsTo = [country: Country]

    static constraints = {
        name nullable: false, blank: false, unique: ['country'], maxSize: 255
        country nullable: false, blank: false
        stars nullable: false, blank: false, min: 1, max: 5
        link nullable: true, blank: true
    }
}
