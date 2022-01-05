//
//  Service.swift
//  Common
//
//  Created by Sagaya Abdul on 8/18/21.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa


public class Service {
    static var request: DataRequest!
    public static func fetch<T:Codable>(_ type:T.Type, url:String, method: HTTPMethod, parameters:Parameters? = nil, headers:HTTPHeaders? = nil, manager:SessionManager = SessionManager.default) -> Single<T>{        
        
        return Single<T>.create { (observer) -> Disposable in
            
            var header: HTTPHeaders = [ : ]
            if let apiKey = UserDefaults.standard.string(forKey: "authKey") {
                header = ["x-access-token": apiKey]
            }
            request = manager.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default ,headers: header).validate()
            
            request.responseData { (response) in
                if response.result.isSuccess{
                    if let data = response.data{
                        let decoder = JSONDecoder()
                        do {
                            let _response = try decoder.decode(T.self, from: data)
                            observer(.success(_response))
                            
                        }catch{
                            let error = ErrorModel(message: "An error has occured")
                            observer(.failure(error))
                        }
                    }
                }else{
                    observer(.failure(ErrorModel(message: "An error has occured")))
                }
                
            }
            
            return Disposables.create()
            
        }
        
    }
}
