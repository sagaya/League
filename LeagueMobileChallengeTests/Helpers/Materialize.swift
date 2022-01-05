//
//  File.swift
//  LeagueMobileChallengeTests
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import RxBlocking

extension MaterializedSequenceResult {
    var success: T? {
        if case .completed(let success) = self {
            return success.first
        }
        return nil
    }
    
    var failure: Error? {
        if case .failed(_, let error) = self {
            return error
        }
        return nil
    }
}
