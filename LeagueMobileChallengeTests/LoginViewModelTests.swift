//
//  LoginViewModel.swift
//  LeagueMobileChallengeTests
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import XCTest
import RxBlocking
import Common

@testable import LeagueMobileChallenge

class LoginViewModelTests: XCTestCase {
    var sut: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        sut = LoginViewModel(servicing: LoginMockService())
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testLogin() throws{
        let expectedLoginResponse = try Login.loadStub()
        let jsonData = try XCTUnwrap(JsonReaderHelper.loadJsonData(for: "login"))

        MockURLProtocol.responseWithData(object: jsonData)
        UserDefaults.standard.removeObject(forKey: "authKey")
        let result = sut.login().toBlocking().materialize()
        let user = try XCTUnwrap(result.success)
        
        XCTAssertEqual(expectedLoginResponse.apiKey, user.apiKey)
    }
    
    func testLoginFails() throws{
        let expectedError =  ErrorModel(message: "An error has occured")
        let jsonData = try XCTUnwrap(JsonReaderHelper.loadJsonData(for: "login_error"))

        MockURLProtocol.responseWithData(object: jsonData)
        UserDefaults.standard.removeObject(forKey: "authKey")
        let result = sut.login().toBlocking().materialize()
        let error = try XCTUnwrap(result.failure)
        
        XCTAssertEqual(error.asApiError, expectedError)
    }
    
    func testLoginCache() throws{
        let expectedLoginResponse = try Login.loadStub()
        UserDefaults.standard.setValue(expectedLoginResponse.apiKey, forKey: "authKey")
        let jsonData = try XCTUnwrap(JsonReaderHelper.loadJsonData(for: "login"))

        MockURLProtocol.responseWithData(object: jsonData)
        
        let result = sut.login().toBlocking().materialize()
        let user = try XCTUnwrap(result.success)

        XCTAssertEqual(expectedLoginResponse.apiKey, user.apiKey)
    }
    
    

}


