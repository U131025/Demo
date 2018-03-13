//
//  LoginService.swift
//  SwiftDemo
//
//  Created by Mojy on 2018/1/30.
//  Copyright © 2018年 com.swiftdemo.app. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Moya
import Alamofire

class ValidationService {
    
    static let instance = ValidationService()
    let provider = MoyaProvider<NetApiManager>()
    
    var loginTime: String?
    
    private init () {
        
    }
    
    //用户名验证
    func validateUserName (_ username : String) -> Observable<Result> {
        
        if username.count == 0 {
            return .just(.empty)
        }
        
        if username.count > 6 {
            return .just(.failed(message: "不能超过6个字符"))
        }
        
        return .just(.ok(message: "输入正确"))        
    }
    
    //登录返回结果
    func login (username: String, password: String) -> Observable<Result> {
        
        //校验用户名和密码
//        if username != "Test" && password != "123" {
//            return .just(.failed(message: "用户名或密码不正确"))
//        }
//
//        return .just(.ok(message: "登录成功"))
        
        return provider.rx
            .request(.Login(username: username, password: password, loginTime: self.loginTime!))
            .asObservable()
            .filterSuccessfulStatusCodes()
            .mapModel(UserModel.self)
            .map { (model) in
                
                if model.accountName != nil {
                    return .ok(message: "登录成功")
                }
                
                return .failed(message: "登录失败")
        }
    }
    
    func getLoginTime() {
        
        _ = provider.rx
            .request(.LoginNeedTime)
        .asObservable()
        .mapModel(LoginTimeModel.self)
        .subscribe(onNext: { (model) in

            print("\(model)")
            self.loginTime = "\(model.time)"

        })

    }
    
}
