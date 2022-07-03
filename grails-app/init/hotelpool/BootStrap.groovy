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

        country1.addToHotels(hotel1)
        country1.addToHotels(hotel2)
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
