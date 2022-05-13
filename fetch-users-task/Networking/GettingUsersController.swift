//
//  GettingUsersController.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 22/01/2022.
//

import Foundation

class GettingUsersController {
    
    static let shared = GettingUsersController()
    
    private init() {}
    
    let urlString = "https://randomuser.me/api/?results=10"

    func getUsers(completion: @escaping (Result<[User], RequestError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _ , error in
            if error != nil {
                completion(.failure(.failedRequest))
                return
            }
            if let data = data {
                do {
                    let newUser = try JSONDecoder().decode(Model.self, from: data)
                    completion(.success(newUser.results))
                } catch {
                    print("Error decoding users: \(error)")
                    completion(.failure(.errorDecode))
                }
            } else {
                completion(.failure(.unknownError))
            }
        }.resume()
    }
    
    enum RequestError: Error {
        case invalidUrl
        case failedRequest
        case errorDecode
        case unknownError
    }
}
