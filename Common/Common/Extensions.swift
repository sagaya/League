//
//  Extensions.swift
//  Common
//
//  Created by Sagaya Abdul on 8/18/21.
//

import Foundation


extension String {
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}


public typealias Closure = (() -> ())
