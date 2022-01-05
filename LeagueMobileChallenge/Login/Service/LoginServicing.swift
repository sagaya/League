//
//  LoginServicing.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginServicing {
    func login() -> Single<Login>
}
