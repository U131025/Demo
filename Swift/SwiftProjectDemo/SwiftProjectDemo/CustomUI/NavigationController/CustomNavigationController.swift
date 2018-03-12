//
//  CustomNavigationController.swift
//  SwiftDemo
//
//  Created by Mojy on 2018/1/22.
//  Copyright © 2018年 com.swiftdemo.app. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20),
                                                  NSAttributedStringKey.foregroundColor: UIColor.white];
        self.navigationBar.setBackgroundImage(createImageWithColor(color: RGB(red: 37, green: 41, blue: 57)), for: .default)

        self.navigationBar.shadowImage = UIImage.init()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count != 0 {
            
            let leftButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 20, height: 44))
            leftButton.imageView?.contentMode = .scaleAspectFit
            leftButton.setImage(UIImage.init(named: "back"), for: .normal)
            leftButton.addTarget(self, action: #selector(backAtion), for: .touchUpInside)
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftButton)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func backAtion () -> Void {
        popViewController(animated: true)
    }
    

}
