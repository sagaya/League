//
//  Post.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import Common

class Post: Codable {
    let userID, id: Int?
    let title, body: String?
    var user: User?
    
    public func setUser(_ user: User?){
        self.user = user
    }

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body,user
    }
}

typealias Posts = [Post]


extension Posts {
    static func loadStub() throws -> Posts {
        guard let response = try? JsonReaderHelper.load(
                model: Posts.self,
                from: "Posts"
        )else {
            throw ErrorModel(message: "Error Loading JSON")
        }
        return response
    }
}
