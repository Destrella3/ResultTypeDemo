import Foundation

enum NewtworkError: Error {
    case badURL
    case badStatusCode
    case apiError(Error)
    case jsonDecodingError(Error)
}

class YelpAPIClient {
    // Result type in Swift 5 in a generic enum used on asynchrounous calls
    // the result is an enum that validates a .success or .failure against the call
    public func searchBusinesses(onCompletion: @ escaping (Result<[YelpContainer], NewtworkError>) -> Void) {
        let endPointUrl = "https://api.yelp.com/v3/businesses/search?term=coffee&location=10023"
        guard let url = URL(string: endPointUrl) else {
            onCompletion(.failure(.badURL))
            return
        }
        var request = URLRequest(url: url)
        let accessToken = SecretKeys.YelpAPIKey
        request.setValue("Bearer Token \(accessToken)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                onCompletion(.failure(.apiError(error)))
            } else if let data = data {
                do {
                    let buisness = try JSONDecoder().decode([Businesses].self, from: data)

                } catch {

                }
            }
        }
        task.resume()
    }
}
