//
//  ViewController.m
//  LLProgressHUD
//
//  Created by 冯晓林 iMac on 2016/12/12.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "ViewController.h"
#import "LLProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    

    
}



-(void)viewDidAppear:(BOOL)animated{

    
    //    [LLProgressHUD showBriefMessage:@"哈哈"];
    
    //    [LLProgressHUD showBriefMessage:@"添加在Controller的View上" InView:self.view];
    //    [LLProgressHUD showLoadingInView:self.view];
    //    [LLProgressHUD showLoadingWithMessage:@"正在加载" WithView:self.view];
    
    [LLProgressHUD showImage:@"warning" WithMessage:@"自定义图片"];
    
    [LLProgressHUD hideDelayTime:2];
    
}

@end
