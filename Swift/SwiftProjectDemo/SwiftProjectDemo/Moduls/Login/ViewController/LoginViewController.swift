//
//  LoginViewController.swift
//  SwiftDemo
//
//  Created by Mojy on 2018/1/30.
//  Copyright © 2018年 com.swiftdemo.app. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var useranmeTextField: UITextField!
    
    @IBOutlet weak var usernameTitleLabel: UILabel!
    @IBOutlet weak var passwordTitleLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: LoginViewModel!
    
    let disopseBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "用户登录"

        self.useranmeTextField.text = "18612345676"
        self.passwordTextField.text = "qweqwe123"

        // Do any additional setup after loading the view.
        viewModel = LoginViewModel.init(input: (useranmeTextField.rx.text.orEmpty.asDriver(), passwordTextField.rx.text.orEmpty.asDriver(),loginButton.rx.tap.asDriver()), service: ValidationService.instance)
        
        //bindings
//        viewModel.usernameUsable
//            .drive(onNext: {
//
//            })
//            .addDisposableTo(disopseBag)
        
        //
        viewModel.loginResult
            .drive(onNext: { [weak self] result in

                print("\(result)")
                self?.view.endEditing(true)

                switch result {
                case let .ok(message):
                    self?.showAlert(message: message)
                case .empty:
                    self?.showAlert(message: "")
                case let .failed(message):
                    self?.showAlert(message: message)
                }

            })
            .disposed(by: disopseBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LoginViewController {
    
    func showAlert(message: String) {
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertViewController.addAction(action)
        present(alertViewController, animated: true, completion: nil)
    }
}
