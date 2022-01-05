//
//  URLHelper.swift
//  Common
//
//  Created by Sagaya Abdul on 8/18/21.
//

import Foundation


public class URLHelper: NSObject {
    
    public class func getURL(_ URLKey: String) -> String{
        return self.getURL(URLKey, withURLParam: [:])
    }
    
    public class func getURL(_ URLKey: String ,withURLParam: Dictionary<String,String>) -> String{
        if (!withURLParam.isEmpty){
            var str: String!
            str = Api.relativeURL()[URLKey]!
            for (key,value) in withURLParam{
                str = str.replacingOccurrences(of: ":" + key, with: value)
            }
            return Api.baseURL + str!
        }else{
            return Api.baseURL + Api.relativeURL()[URLKey]!
        }
    }
    
    
}
