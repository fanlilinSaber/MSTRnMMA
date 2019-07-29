//
//  MMAManager.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/5.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MMACommandSendable;
@class MMAAbility, RCTBridge, PWCommand;

@interface MMAManager : NSObject
/*&* 解析和转换对应实体对象的关键 ability */
@property (nonatomic, strong, readonly) MMAAbility *ability;
/*&* 接收到RN消息处理的Delegate */
@property (nonatomic, weak) id handleDelegate;

+ (instancetype)sharedInstance;

/**
 根据bundleURL获取加载RN的Bridge，只支持同一个bundleURL 加载多个模块，不支持同时加载多个bundleURL

 @param bundleURL bundleURL
 @return RCTBridge
 */
- (RCTBridge *)bridgeFromBundleURL:(NSURL *)bundleURL;

/**
 配置IOS于RN通信协议解析类
 
 @param ability 解析和转换对应实体对象的关键 ability
 @return MMABridgeManager
 */
- (instancetype)config:(MMAAbility *)ability;

/**
 发送消息
 
 @param command custom MMACommand
 */
- (void)send:(PWCommand<MMACommandSendable> *)command;

/**
 注册回调block

 @param callback 回调block
 @param callbackId 回调blockId
 */
- (void)addCallback:(id)callback withCallbackId:(NSString *)callbackId;

/**
 发送消息，如果 callbackId != nil 会通过 callback 发送消息

 @param command MMACommand
 @param callbackId 指定发送的 callbackId
 */
- (void)send:(PWCommand<MMACommandSendable> *)command withCallbackId:(NSString *)callbackId;

/**
 关闭MMA页面

 @param flag 是否需要动画
 @param complete RN(MMA)完成之后才会主动调用关闭，用于IOS主动调用关闭后需等待RN回调关闭才可以进行后续处理,如果未加载MMA页面会直接回调
 */
- (void)closeViewControllerAnimated:(BOOL)flag complete:(void (^)(void))complete;

/**
 释放未使用的 ’callback‘ 和 其他
 */
- (void)invalidate;

@end

