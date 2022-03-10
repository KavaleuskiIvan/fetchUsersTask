//
//  Model.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 22/01/2022.
//

import Foundation

struct Model: Decodable {
    let results: [User]
}
struct User: Decodable {
    let gender: String
    let phone: String
    let email: String
    let nat: String
    let name: UserName
    let picture: Picture
    let location: Location
}
struct UserName: Decodable {
    let title: String
    let first: String
    let last: String
}
struct Picture: Decodable {
    let medium: URL
}
struct Location: Decodable {
    let coordinates: Coordinates
}
struct Coordinates: Decodable {
    let latitude: String
    let longitude: String
}
