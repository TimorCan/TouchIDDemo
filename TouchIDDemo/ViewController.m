//
//  ViewController.m
//  TouchIDDemo
//
//  Created by juxi-ios on 16/7/21.
//  Copyright © 2016年 zhoucan. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "EKViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *touchBtn;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(id)sender {
  
    LAContext * context = [[LAContext alloc]init];
    //首先判断是否支持TouchID
    
    NSError * error = nil;
    
    
    
  BOOL valid =  [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                                     error:&error];
    if (valid) {
        self.messageLabel.text = @"您的设备支持TouchID";
        //验证身份并跳转
        
       
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:@"请输入TouchID验证身份"
                          reply:^(BOOL success, NSError * _Nullable error) {
                              
                              if (success) {
                                  
                                  UIStoryboard * storyb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                  EKViewController * ekVc = [storyb instantiateViewControllerWithIdentifier:@"EKViewController"];
                                  [self.navigationController pushViewController:ekVc animated:YES];
                                  
                              }else
                              {
                                   self.messageLabel.text = error.description;
                                  
                                  if (error.code == kLAErrorUserFallback) {
                                      NSLog(@"User tapped Enter Password");
                                  } else if (error.code == kLAErrorUserCancel) {
                                      NSLog(@"User tapped Cancel");
                                  } else {
                                      NSLog(@"Authenticated failed.");
                                  }
                              }
            
                          }];
        
    }
    
    else
    {
        self.touchBtn.hidden = YES;
        self.messageLabel.text = @"您的设备不支持TouchID";
    }
    
    
    
}

@end
