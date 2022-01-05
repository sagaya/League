//
//  Api.swift
//  Common
//
//  Created by Sagaya Abdul on 8/18/21.
//

import Foundation

struct Api {
    static let baseURL = Bundle.main.infoDictionary!["API_ENDPOINTS"] as! String
    
    static func relativeURL() -> Dictionary<String, String>{
        return [
            "LOGIN": "/login",
            "POSTS": "/posts",
            "USERS": "/users"
        ]
    }

    
}
