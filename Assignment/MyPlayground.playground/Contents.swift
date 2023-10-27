import UIKit
class ApiManager {
    static let apiManager = ApiManager()
    private init() {}
    let endpoint = "https://api.github.com/repos/Alamofire/Alamofire/issues"

    func getRequest(completion: @escaping ([[String: Any]])-> Void) {
        print("API Get Request")
        guard let url = URL(string: endpoint) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, err in
            if let err = err {
                print("Error: \(err)")
               completion([])
                return
            }
            guard let data = data else {
                print("No data received")
                completion([])
                return
            }
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    print("Received JSON Array with \(jsonArray.count) items.")
                    completion(jsonArray)
                } else {
                    completion([])
                }
            } catch {
                print("Error parsing JSON: \(error)")
                completion([])
            }
        }.resume()
    }
}

// Usage:
ApiManager.apiManager.getRequest { jsonArray in
    print(jsonArray)
}
