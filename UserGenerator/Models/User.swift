//
//  User.swift
//  UserGenerator
//
//  Created by Marat on 17.11.2021.
//

import Foundation

struct Results {
    let results: User?
}

struct User: Decodable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let phone: String?
    let picture: Picture?
}

struct Name: Decodable {
    let first: String?
    let last: String?
}

struct Location: Decodable {
    let city: String?
    let country: String?
    let postcode: String
}

struct Login: Decodable {
    let username: String?
    let password: String?
}

struct Picture: Decodable {
    let large: String?
}


