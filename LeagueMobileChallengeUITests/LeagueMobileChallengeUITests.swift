//
//  LeagueMobileChallengeUITests.swift
//  LeagueMobileChallengeUITests
//
//  Created by Kelvin Lau on 2019-01-09.
//  Copyright © 2019 Kelvin Lau. All rights reserved.
//

import XCTest
@testable import LeagueMobileChallenge

class LeagueMobileChallengeUITests: XCTestCase {
    var sut: PostsController!
    override func setUp() {
        sut = PostsController(viewModel: PostsViewModel(servicing: PostsMockService()))
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDown() {
        sut = nil
    }
    
}
