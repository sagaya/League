//
//  Login.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import Common

struct Login: Codable {
    let apiKey: String

    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
    }
}

extension Login {
    static func loadStub() throws -> Login {
        guard let response = try? JsonReaderHelper.load(
                model: Login.self,
                from: "login"
        )else {
            throw ErrorModel(message: "Error Loading JSON")
        }
        return response
    }
}
