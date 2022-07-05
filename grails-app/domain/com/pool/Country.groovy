package com.pool

class Country {
    String name
    String capital

    static hasMany = [hotels: Hotel]

    static constraints = {
        name nullable: false, blank: false, unique: true, maxSize: 255
        capital nullable: false, blank: false, maxSize: 128
    }
}
