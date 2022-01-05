//
//  LoginViewModel.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import Common
import Alamofire
import RxSwift


class LoginViewModel {
    let servicing:LoginServicing!
    init(servicing: LoginServicing) {
        self.servicing = servicing
    }
    
    func login() -> Single<Login>{
        let apiKey = UserDefaults.standard.object(forKey: "authKey") as? String
        guard apiKey == nil else {
            return Single<Login>.create { (observer) -> Disposable in
                observer(.success(Login(apiKey: apiKey!)))
                return Disposables.create()
            }
        }
        
        
        return servicing.login()
    }
    
}
