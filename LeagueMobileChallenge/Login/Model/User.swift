//
//  User.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import Common
struct User: Codable {
    let id: Int?
    let avatar: Avatar?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Avatar
struct Avatar: Codable {
    let large, medium, thumbnail: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}

typealias Users = [User]

extension Users {
    static func loadStub() throws -> Users {
        guard let response = try? JsonReaderHelper.load(
                model: Users.self,
                from: "Users"
        )else {
            throw ErrorModel(message: "Error Loading JSON")
        }
        return response
    }
}
