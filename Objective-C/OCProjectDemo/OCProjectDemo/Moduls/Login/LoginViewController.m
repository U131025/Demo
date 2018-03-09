//
//  LoginViewController.m
//  OCProjectDemo
//
//  Created by Mojy on 2018/3/9.
//  Copyright © 2018年 Mojy. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initConfig];
    [self layoutConfig];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
/**
 控件初始化设置
 */
- (void)initConfig
{
    self.view.backgroundColor = DefaultColorBlue;
    
    self.titleLabel.text = @"登录";
    self.titleLabel.font = Font(18);
    self.titleLabel.textColor = [UIColor whiteColor];
    

}

/**
 布局设置
 */
- (void)layoutConfig
{
    
}

#pragma mark - Handle

- (IBAction)Login:(id)sender
{
    
}

- (IBAction)cancel:(id)sender
{
    
}

@end
