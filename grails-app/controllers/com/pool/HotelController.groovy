package com.pool

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class HotelController {

    HotelService hotelService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def search() {
        def countryList = []
//      TODO: countryList.add("all")
        countryList.addAll(Country.list())
        def result = generateSearchResult(params.countrySelector, params.hotelField,
                params.max?.toInteger() ?: 10, params.offset?.toInteger() ?: 0)
        return [countryList: countryList, searchResult: result, resultCount: result.totalCount]
    }

    private static generateSearchResult(String countrySelector, String hotel, Integer max, Integer offset) {
        def c = Hotel.createCriteria()

        def result = c.list(max: max, offset: offset) {
            if (countrySelector != null && countrySelector != "all") {
                'country' {
                    eq("name", countrySelector)
                }
            }

            if (hotel != null) {
                hotel = hotel.trim()
                if (hotel != "")
                    ilike("name", "%${hotel}%")
            }

            and {
                order("stars", "desc")
                order("name", "asc")
            }
        }

        return result
    }

    def index() {
        respond hotelService.list(params), model: [hotelCount: hotelService.count()]
    }

    def show(Long id) {
        def hotel = hotelService.get(id)
        respond hotel, model: [countryName: hotel.country.name]
    }

    def create() {
        respond new Hotel(params)
    }

    def save(Hotel hotel) {
        if (hotel == null) {
            notFound()
            return
        }

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            respond hotel.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'com.pool.hotel.label', default: 'Hotel'), hotel.id])
                redirect hotel
            }
            '*' { respond hotel, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond hotelService.get(id), model: [countryList: Country.list()]
    }

    def update(Hotel hotel) {
        if (hotel == null) {
            notFound()
            return
        }

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            respond hotel.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'com.pool.hotel.label', default: 'Hotel'), hotel.id])
                redirect hotel
            }
            '*' { respond hotel, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        hotelService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'com.pool.hotel.label', default: 'Hotel'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'com.pool.hotel.label', default: 'Hotel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
