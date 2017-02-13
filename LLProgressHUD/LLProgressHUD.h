//
//  LLProgressHUD.h
//  LLProgressHUD
//
//  Created by 冯晓林 iMac on 2016/12/12.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger,LLProgressMode){
    LLProgressModeTextOnly,     //只有文字
    LLProgressModeLoadingOnly,  //只有菊花
    LLProgressModeLoadingText,  //菊花、文字
    LLProgressModeCustomImage,  //自定义图片
    LLProgressModeCustomAnimation   //图片动画
};

static NSString *const LLoadingMessage = @"加载中";
static CGFloat   const LShowTime  = 1.5f;

@interface LLProgressHUD : NSObject

/*===============================   属性   ================================================*/

@property (nonatomic,strong) MBProgressHUD  *hud;

/*===============================   方法   ================================================*/


/**
 * 单例
 */
+(instancetype)shareinstance;



/**
 *  显示简短的提示语，默认1.5秒钟，时间可直接修改LShowTime
 *
 *  @param message 提示信息
 */
+ (void) showBriefMessage:(NSString *) message;
/**
 *  显示简短提示语到view上
 *
 *  @param message 提示语
 *  @param view    要添加到的view
 */
+ (void) showBriefMessage:(NSString *) message InView:(UIView *) view;




/**
 *  只转菊花,不指定View
 */
+ (void) showLoading;
/**
 *  只转菊花，添加到指定的View上
 *
 *  @param view    要添加到的view
 */
+ (void) showLoadingInView:(UIView *) view;




/**
 *  转菊花+文字,不指定View
 *
 *  @param message    提示信息
 */
+ (void) showLoadingWithMessage:(NSString *)message;
/**
 *  转菊花+文字,指定View
 *
 *  @param message   提示信息
 *  @param view      要添加到的view 
 *
 */
+ (void) showLoadingWithMessage:(NSString *)message WithView:(UIView *)view;


/**
 *  自定义图片,不指定View
 *
 *  @param imageName  图片名称
 *  @param message    提示信息
 */
+ (void) showImage:(NSString *)imageName WithMessage:(NSString *)message;
/**
 *  自定义图片,指定View
 *  
 *  @param imageName 图片名称
 *  @param message   提示信息
 *  @param view      要添加到的view
 *
 */
+ (void) showImage:(NSString *)imageName WithMessage:(NSString *)message WithView:(UIView *)view;


//消失
+ (void)hide;
+ (void)hideDelayTime:(NSInteger)delayTime;


@end
