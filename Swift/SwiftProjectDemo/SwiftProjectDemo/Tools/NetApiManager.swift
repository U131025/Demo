//
//  NetApiManager.swift
//  SwiftProjectDemo
//
//  Created by Mojy on 2018/3/12.
//  Copyright © 2018年 Mojy. All rights reserved.
//

import Foundation
import Moya

enum NetApiManager {
    case Login(username:String, password:String, loginTime:String)
    case LoginNeedTime
    case request(url: String, paramters: [String : Any])
}

extension NetApiManager: TargetType {
    var baseURL: URL {
        return URL.init(string: "http://www.yidianqian.com/app/")!
    }
    
    var path: String {
        switch self {
        case .Login:
            return "login.htm"
        case .LoginNeedTime:
            return "timing.htm"
        case .request(let url, _):
            return url
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .Login(username: let name, password: let pwd, loginTime: let time):
            
            let paramters = ["accountName": "\(name)",
                "password": "\(pwd)",
                "time": "\(time)",
                "flag": "\(name)|\(pwd)|\(time)".md5]
            
            return .requestParameters(parameters: paramters, encoding:URLEncoding.default)
  
        case .LoginNeedTime:
            return .requestPlain
        case .request(_, let parameters):
            return .requestParameters(parameters: parameters, encoding:URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil;
    }
    
}

