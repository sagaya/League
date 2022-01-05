//
//  PostViewModelTests.swift
//  LeagueMobileChallengeTests
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import XCTest
@testable import LeagueMobileChallenge

class PostViewModelTests: XCTestCase {
    var sut: PostsViewModel!
    
    override func setUp() {
        super.setUp()
        sut = PostsViewModel(servicing: PostsMockService())
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testUsersFetch() throws {
        let expectedUsers = try Users.loadStub()
        let jsonData = try XCTUnwrap(JsonReaderHelper.loadJsonData(for: "Users"))
        sut.users = nil
        try AppDelegate.usersStorage.removeAll()
        
        MockURLProtocol.responseWithData(object: jsonData)
        let result = sut.fetchUsers().toBlocking().materialize()
        let users = try XCTUnwrap(result.success)
        
        
        XCTAssertEqual(users.count, expectedUsers.count)
    }
    
    func testPostsFetch() throws {
        let expectedPosts = try Posts.loadStub()
        let jsonData = try XCTUnwrap(JsonReaderHelper.loadJsonData(for: "Posts"))

        MockURLProtocol.responseWithData(object: jsonData)
        let result = sut.fetchPosts().toBlocking().materialize()
        let posts = try XCTUnwrap(result.success)

        XCTAssertEqual(posts.count, expectedPosts.count)
    }
    
    func testPostHasUser() throws {
        let usersJSON = try XCTUnwrap(JsonReaderHelper.loadJsonData(for: "Users"))

        MockURLProtocol.responseWithData(object: usersJSON)
        let _ = sut.fetchUsers().toBlocking().materialize()

        let postsJSON = try XCTUnwrap(JsonReaderHelper.loadJsonData(for: "Posts"))

        MockURLProtocol.responseWithData(object: postsJSON)
        let _ = sut.fetchUsers().toBlocking().materialize()
        
        let finalFetchResult = sut.fetchPosts().toBlocking().materialize()
        let userPosts = try XCTUnwrap(finalFetchResult.success)
        
        XCTAssertTrue(userPosts.count != 0)
        
        let validUserPosts = userPosts.filter {
            $0.userID == $0.user?.id
        }

        XCTAssertTrue(validUserPosts.count != 0)
    }
    

}
