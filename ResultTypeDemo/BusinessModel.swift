import Foundation

struct YelpContainer: Codable {
    let businesses: [Businesses]
}

struct Businesses: Codable {
    let id: String
    let alias: String
    let name: String
    let imageURL: String
    let isClosed: Bool
    let url: String
    let rating: Double
    let location: Location
    let phone: String
    let coordinates: Coordinates
    enum CodingKeys: String, CodingKey {
        case id
        case alias
        case name
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case url
        case rating
        case location
        case phone
        case coordinates
    }
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct Location: Codable {
    let address1: String
    let city: String
    let zip_code: String
    let country: String
    let state: String
}
