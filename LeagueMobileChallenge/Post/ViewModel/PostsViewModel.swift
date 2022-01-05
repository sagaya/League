//
//  PostsViewModel.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import Common
import Alamofire
import RxSwift


class PostsViewModel {
    
    public let userPosts = PublishSubject<Posts>()
    
    public var users = try? AppDelegate.usersStorage.object(forKey: "user")
    
    let servicing:PostsServicing!
    init(servicing: PostsServicing) {
        self.servicing = servicing
    }
    
    public func fetchPosts() -> Single<Posts> {
        Single.zip(fetchUsers(), loadPosts()) {
            let users = $0
            let posts = $1.map { (post) -> Post in
                let user = users.filter { $0.id == post.userID }
                post.setUser(user.first)
                return post
            }
            self.userPosts.onNext(posts)
            return posts
        }
    }
    
    func loadPosts() -> Single<Posts>{
        return servicing.loadPosts()
    }
    
    func fetchUsers() -> Single<Users>{
        guard  users == nil, users?.count != .some(0) else {
            return Single<Users>.create { (observer) -> Disposable in
                observer(.success(self.users!))
                return Disposables.create()
            }
        }
        
        return servicing.fetchUsers()
    }    
}
