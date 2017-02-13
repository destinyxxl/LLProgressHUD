//
//  LLProgressHUD.m
//  LLProgressHUD
//
//  Created by 冯晓林 iMac on 2016/12/12.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "LLProgressHUD.h"

@implementation LLProgressHUD

static LLProgressHUD *instance = nil;

+(instancetype)shareinstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
    });
    
    return instance ;
}

+(void)show:(NSString *)msg inView:(UIView *)view mode:(LLProgressMode)myMode customImage:(NSString *)customImage{
    //如果已有弹框，先消失
    
    if ([LLProgressHUD shareinstance].hud != nil) {
        [[LLProgressHUD shareinstance].hud hideAnimated:YES];
        [LLProgressHUD shareinstance].hud = nil;
    }

    
    if (view == nil) {
        view = [[UIApplication sharedApplication].delegate window];
    }

    [LLProgressHUD shareinstance].hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //设置黑色背景、白色字体
    [LLProgressHUD shareinstance].hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    [LLProgressHUD shareinstance].hud.bezelView.color = [UIColor blackColor];
    [LLProgressHUD shareinstance].hud.contentColor = [UIColor whiteColor];
    
    
    [[LLProgressHUD shareinstance].hud setMargin:10];
    
    //消失的动画
    [LLProgressHUD shareinstance].hud.animationType = MBProgressHUDAnimationZoomOut;
    
    switch (myMode) {
        case LLProgressModeTextOnly:

            [LLProgressHUD shareinstance].hud.mode = MBProgressHUDModeText;
            [LLProgressHUD shareinstance].hud.label.text = msg;
            [LLProgressHUD shareinstance].hud.label.font = [UIFont systemFontOfSize:15];

            break;
            
        case LLProgressModeLoadingOnly:

            [LLProgressHUD shareinstance].hud.mode = MBProgressHUDModeIndeterminate;
            break;
        case LLProgressModeLoadingText:{

            [LLProgressHUD shareinstance].hud.mode = MBProgressHUDModeIndeterminate;
            [LLProgressHUD shareinstance].hud.detailsLabel.text = msg ;
            [LLProgressHUD shareinstance].hud.detailsLabel.font = [UIFont systemFontOfSize:15];
            break;
        }
        case LLProgressModeCustomImage:

            [LLProgressHUD shareinstance].hud.mode = MBProgressHUDModeCustomView;
            [LLProgressHUD shareinstance].hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:customImage]];
            [LLProgressHUD shareinstance].hud.detailsLabel.text = msg;
            [LLProgressHUD shareinstance].hud.label.font = [UIFont systemFontOfSize:15];
            break;
//        case LLProgressModeCustomAnimation:
//            [LLProgressHUD shareinstance].hud.mode = MBProgressHUDModeCustomView;
//            [LLProgressHUD shareinstance].hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
//            break;
            
        default:
            NSLog(@"...");
            break;
    }

}


#pragma mark  纯文字
+ (void) showBriefMessage:(NSString *) message{
    
    [self show:message inView:nil mode:LLProgressModeTextOnly customImage:nil];
    
}

+(void)showBriefMessage:(NSString *)message InView:(UIView *)view{
    
    [self show:message inView:view mode:LLProgressModeTextOnly customImage:nil];

}

#pragma mark  只有菊花
+(void)showLoading{

    [self show:nil inView:nil mode:LLProgressModeLoadingOnly customImage:nil];
}

+(void)showLoadingInView:(UIView *)view{

    [self show:nil inView:view mode:LLProgressModeLoadingOnly customImage:nil];
}

#pragma mark 菊花+文字
+(void)showLoadingWithMessage:(NSString *)message{

    [self show:message inView:nil mode:LLProgressModeLoadingText customImage:nil];
}

+ (void) showLoadingWithMessage:(NSString *)message WithView:(UIView *)view{

    [self show:message inView:view mode:LLProgressModeLoadingText customImage:nil];
}

#pragma mark  自定义图片
+ (void) showImage:(NSString *)imageName WithMessage:(NSString *)message{

    [self show:message inView:nil mode:LLProgressModeCustomImage customImage:imageName];
}

+ (void) showImage:(NSString *)imageName WithMessage:(NSString *)message WithView:(UIView *)view{

    [self show:message inView:view mode:LLProgressModeCustomImage customImage:imageName];
}


#pragma mark 指示器消失
+ (void)hide{
    if ([LLProgressHUD shareinstance].hud != nil) {
        [[LLProgressHUD shareinstance].hud hideAnimated:YES];
    }
}


+ (void)hideDelayTime:(NSInteger)delayTime{
    if ([LLProgressHUD shareinstance].hud != nil) {
        [[LLProgressHUD shareinstance].hud hideAnimated:YES afterDelay:delayTime];
    }
}





@end
