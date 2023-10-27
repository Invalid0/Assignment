//
//  ApiManager.swift
//  Assignment
//
//  Created by EMPULSE on 27/10/23.
//

import Foundation
//class ApiManager {
//    static let apiManager = ApiManager()
//    private init() {}
//    let endpoint = "https://api.github.com/repos/Alamofire/Alamofire/issues"
//
//    func getRequest(completion: @escaping ([[String: Any]])-> Void) {
//        print("API Get Request")
//        guard let url = URL(string: endpoint) else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, err in
//            print("type of Json =\(type(of: data!))")
//            if let err = err {
//                print("Error: \(err)")
//               completion([])
//                return
//            }
//            guard let data = data else {
//                print("No data received")
//                completion([])
//                return
//            }
//            do {
//                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
//                    print("Received JSON Array with \(jsonArray.count) items.")
//                    completion(jsonArray)
//                } else {
//                    completion([])
//                }
//            } catch {
//                print("Error parsing JSON: \(error)")
//                completion([])
//            }
//        }.resume()
//    }
//}


class ApiManager {
    static let apiManager = ApiManager()
    private init() {}

    let endpoint = "https://api.github.com/repos/Alamofire/Alamofire/issues"

    func getRequest(completion: @escaping ([Issue]) -> Void) {
        print("API Get Request")
        guard let url = URL(string: endpoint) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion([])
                return
            }

            guard let data = data else {
                print("No data received")
                completion([])
                return
            }

            do {
                let decoder = JSONDecoder()
                let issues = try decoder.decode([Issue].self, from: data)
                completion(issues)
            } catch {
                print("Error decoding JSON: \(error)")
                completion([])
            }
        }.resume()
    }
}
