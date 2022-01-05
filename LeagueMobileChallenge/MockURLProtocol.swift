//
//  MockURLProtocol.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/19/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import Common

final class MockURLProtocol: URLProtocol {
    private(set) var activeTask: URLSessionTask?
    enum ResponseType {
        case error(Error)
        case success(Data)
    }
    static var responseType: ResponseType!
    private lazy var session: URLSession = {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.ephemeral
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override class func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return false
    }
    
    override func startLoading() {
        activeTask = session.dataTask(with: request)
        activeTask?.cancel() // We don’t want to make a network request, we want to return our stubbed data ASAP
    }
    
    override func stopLoading() {
        activeTask?.cancel()
    }
}

// MARK: - URLSessionDataDelegate
extension MockURLProtocol: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        client?.urlProtocol(self, didLoad: data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        switch MockURLProtocol.responseType {
        case .error(let error)?:
            client?.urlProtocol(self, didFailWithError: error)
        case .success(let response)?:
            let headers  = ["Accept": "application/json", "ContentType": "application/json"]
            let httpResponse = HTTPURLResponse(url: self.request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: headers)
            client?.urlProtocol(self, didReceive: httpResponse!, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: response)
        default:
            break
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
}

extension MockURLProtocol {

    static func responseWithFailure() {
        MockURLProtocol.responseType = MockURLProtocol.ResponseType.error(ErrorModel(message: "An Error occurred"))
    }
    
    static func responseWithData(object: Data) {
        MockURLProtocol.responseType = MockURLProtocol.ResponseType.success(object)
    }
}
