//
//  LoginService.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import Common
import RxSwift

class LoginService: LoginServicing {
    static let shared = LoginService()
    
    func login() -> Single<Login>{        
        return Service.fetch(Login.self, url: URLHelper.getURL("LOGIN"), method: .get)
            .do(onSuccess: { response in
                UserDefaults.standard.setValue(response.apiKey, forKey: "authKey")
            })
    }
    
}
