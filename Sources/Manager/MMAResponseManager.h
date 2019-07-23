//
//  MMAResponseManager.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTBridge.h>

@class PWCommand;

// MMA 和 IOS 消息 delegate
@protocol MMAResponseManagerDelegate <NSObject>
@optional

/**
 收到RN的消息

 @param command 消息内容
 @param callback 回调
 */
- (void)didReceiveCommand:(PWCommand *)command callback:(void (^)(NSArray *response))callback;

/**
 收到RN的消息

 @param command 消息内容
 @param callbackId 如果不为nil 说明需要回调，实现方需要保存这个Id,后面回调消息指定callbackId发送
 */
- (void)didReceiveCommand:(PWCommand *)command callbackId:(NSString *)callbackId;

@end

// MMA页面关闭delegate
@protocol MMADismissViewControllerDelegate <NSObject>
@required

/**
 关闭MMA控制器
 */
- (void)dismissViewController;

@end

@interface MMAResponseManager : NSObject <RCTBridgeModule>
@property (weak, nonatomic) id<MMAResponseManagerDelegate> delegate;
@property (weak, nonatomic) id<MMADismissViewControllerDelegate> dismissDelegate;
@end


@interface RCTBridge (MMAResponseManager)

- (MMAResponseManager *)responseManager;

@end

