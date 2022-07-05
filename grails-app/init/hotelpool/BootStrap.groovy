package hotelpool

import com.pool.Country
import com.pool.Hotel

class BootStrap {

    def init = { servletContext ->
        def country1 = new Country(name: "country1", capital: "capital1").save(failOnError: true)
        def country2 = new Country(name: "country2", capital: "capital2").save(failOnError: true)
        def country3 = new Country(name: "country3", capital: "capital3").save(failOnError: true)

        def hotel1 = new Hotel(name: "hotel1", country: country1, stars: 1).save(failOnError: true)
        def hotel2 = new Hotel(name: "hotel2", country: country1, stars: 4).save(failOnError: true)
        def hotel3 = new Hotel(name: "hotel3", country: country2, stars: 3, link: new URL("http://tencents.info/")).save(failOnError: true)
        def hotel4 = new Hotel(name: "hotel4", country: country2, stars: 1, link: new URL("http://scroll-o-meter.club/")).save(failOnError: true)
        def hotel5 = new Hotel(name: "hotel5", country: country3, stars: 5, link: new URL("https://boringboringboring.com/")).save(failOnError: true)
        def hotel6 = new Hotel(name: "hotel6", country: country1, stars: 1).save(failOnError: true)
        def hotel7 = new Hotel(name: "hotel7", country: country2, stars: 2).save(failOnError: true)
        def hotel8 = new Hotel(name: "hotel8", country: country3, stars: 3).save(failOnError: true)
        def hotel9 = new Hotel(name: "hotel9", country: country1, stars: 4).save(failOnError: true)
        def hotel10 = new Hotel(name: "hotel10", country: country2, stars: 5).save(failOnError: true)
        def hotel11 = new Hotel(name: "hotel11", country: country3, stars: 1).save(failOnError: true)
        def hotel12 = new Hotel(name: "hotel12", country: country1, stars: 2).save(failOnError: true)
        def hotel13 = new Hotel(name: "hotel13", country: country2, stars: 3).save(failOnError: true)
        def hotel14 = new Hotel(name: "hotel14", country: country3, stars: 4).save(failOnError: true)
        def hotel15 = new Hotel(name: "hotel15", country: country2, stars: 5).save(failOnError: true)
        def hotel16 = new Hotel(name: "hotel16", country: country3, stars: 1).save(failOnError: true)

        country1.addToHotels(hotel1)
        country1.addToHotels(hotel2)
        country1.addToHotels(hotel3)
        country1.addToHotels(hotel4)
        country1.addToHotels(hotel5)
        country1.addToHotels(hotel6)
        country1.addToHotels(hotel7)
        country1.addToHotels(hotel8)
        country1.addToHotels(hotel9)
        country1.addToHotels(hotel10)
        country1.addToHotels(hotel11)
        country1.addToHotels(hotel12)
        country1.addToHotels(hotel13)
        country1.addToHotels(hotel14)
        country1.addToHotels(hotel15)
        country1.addToHotels(hotel16)
        country1.save(failOnError: true)

        country2.addToHotels(hotel3)
        country2.addToHotels(hotel4)
        country2.save(failOnError: true)

        country3.addToHotels(hotel5)
        country3.save(failOnError: true)
    }
    def destroy = {
    }
}
