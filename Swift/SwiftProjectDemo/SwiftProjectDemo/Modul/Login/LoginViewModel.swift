//
//  LoginViewModel.swift
//  SwiftDemo
//
//  Created by Mojy on 2018/1/30.
//  Copyright © 2018年 com.swiftdemo.app. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel {
    
    let usernameUsable: Driver<Result>
    let loginResult: Driver<Result>
    
    init(input: (username : Driver<String>, password : Driver<String>, action: Driver<Void>),
         service: ValidationService) {
        
        //输入用户名合法验证
        usernameUsable = input.username.flatMapLatest { username in
            
            return service.validateUserName(username).asDriver(onErrorJustReturn: .failed(message: "创建Service错误"))
        }
        
        //登录结果
        let usernameAndPassword = Driver.combineLatest(input.username, input.password) {
            ($0, $1)
        }
        
        loginResult = input.action.withLatestFrom(usernameAndPassword)
            .flatMapLatest { (username, password) in

                return service.login(username: username, password: password).asDriver(onErrorJustReturn: .failed(message: "创建Service错误"))
        }
        
        service.getLoginTime()
    }
    
}
