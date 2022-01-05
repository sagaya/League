//
//  PostsMockService.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//


import RxSwift
import Common
import Alamofire

class PostsMockService: PostsServicing {
    func loadPosts() -> Single<Posts> {
        return Service.fetch(Posts.self, url: URLHelper.getURL("POSTS"), method: .get,manager: MockSessionManager.manager)
    }
    
    func fetchUsers() -> Single<Users> {        
        return Service.fetch(Users.self, url: URLHelper.getURL("USERS"), method: .get,manager: MockSessionManager.manager)
    }
    
}
