//
//  LoginMockService.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Sagaya Abdul. All rights reserved.
//

import Alamofire
import RxSwift
import Common

class LoginMockService: LoginServicing  {
    static let shared = LoginMockService()
    
    func login() -> Single<Login>{
        return Service.fetch(Login.self, url: URLHelper.getURL("LOGIN"), method: .get,manager: MockSessionManager.manager)
        
    }
    
}
