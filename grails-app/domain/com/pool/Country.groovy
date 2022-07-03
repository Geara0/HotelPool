package com.pool

class Country {
    String name
    String capital

    static hasMany = [hotels: Hotel]

    static constraints = {
        name nullable: false, blank: false, unique: true, maxSize: 255
        capital nullable: false, blank: false, maxSize: 128
    }

    String toString() { return name }

    @Override
    boolean equals(Object obj) {
        if (obj == this)
            return true
        if (obj.getClass() != getClass())
            return false
        return ((Country) obj).name == this.name
    }
}
