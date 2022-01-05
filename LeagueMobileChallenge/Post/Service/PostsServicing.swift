//
//  PostsServicing.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import RxSwift
import Foundation


protocol PostsServicing {
    func loadPosts() -> Single<Posts>
    func fetchUsers() -> Single<Users>
}
