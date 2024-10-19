import SwiftUI

protocol HotelItemProtocol {
    var id: UUID { get }
    var name: String { get }
    var price: Double { get }
    var reviews: [Review]? { get }
}

struct HotelItem: Identifiable, HotelItemProtocol {
    var id = UUID()
    var name: String
    var price: Double
    var type: HotelType
    var reviews: [Review]?
    let picture: String
}


var hotels: [HotelItem] = [
    .init(name: "Royal Dolce", price: 100, type: .standard, reviews: hotel1, picture: "hotel1"),
    .init(name: "Hotel 2", price: 200, type: .standard, reviews: hotel2, picture: "hotel2"),
    .init(name: "Hotel 3", price: 300, type: .standard, reviews: hotel3, picture: "hotel3"),
    .init(name: "Hotel 4", price: 400, type: .standard, reviews: hotel4, picture: "hotel4"),
    .init(name: "Hotel 5", price: 500, type: .standard, reviews: hotel5, picture: "hotel5"),
    .init(name: "Hotel 6", price: 600, type: .standard, reviews: hotel6, picture: "hotel6"),
    .init(name: "Hotel 7", price: 700, type: .standard, reviews: hotel7, picture: "hotel7"),
    .init(name: "Hotel 8", price: 800, type: .deluxe, picture: "hotel8"),
    .init(name: "Hotel 9", price: 900, type: .deluxe, picture: "hotel9"),
    .init(name: "Hotel 10", price: 1000, type: .premium, picture: "hotel10"),
]

func averageStars(for hotel: HotelItem) -> Double {
    guard let reviews = hotel.reviews, !reviews.isEmpty else {
        return 0 // Return 0 if there are no reviews
    }

    let totalStars = reviews.reduce(0) { $0 + $1.star } // Sum the stars
    return Double(totalStars) / Double(reviews.count) // Calculate the average
    
//    let totalStars = reviews.reduce(0){ result, review in
//        return result + review.star
//    }
//    return Double(totalStars) / Double(reviews.count)
}


