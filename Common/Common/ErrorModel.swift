//
//  ErrorModel.swift
//  Common
//
//  Created by Sagaya Abdul on 8/18/21.
//

import Foundation

public struct ErrorModel: Error, Equatable {
    let message: String?
    
    public init(message: String){
        self.message = message
    }
}


public extension Error {
    var asApiError: ErrorModel{
        return self as! ErrorModel
    }
}
