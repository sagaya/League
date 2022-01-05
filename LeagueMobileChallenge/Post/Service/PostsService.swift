//
//  PostsService.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import RxSwift
import Common

class PostsService: PostsServicing {
    func loadPosts() -> Single<Posts> {
        return Service.fetch(Posts.self, url: URLHelper.getURL("POSTS"), method: .get)
    }
    
    func fetchUsers() -> Single<Users> {
        return Service.fetch(Users.self, url: URLHelper.getURL("USERS"), method: .get)
            .do(onSuccess: { response in
                try? AppDelegate.usersStorage.setObject(response, forKey: "user")
            })
    }
    
    
}
