//
//  MMABridgeManager.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>

@protocol MMACommandSendable;
@class MMACommand;

NS_ASSUME_NONNULL_BEGIN

@interface MMABridgeManager : RCTBridge

- (instancetype)initWithBundleURL:(NSURL *)bundleURL;

/**
 发送消息
 
 @param command custom MMACommand
 */
- (void)send:(MMACommand<MMACommandSendable> *)command;

@end

NS_ASSUME_NONNULL_END
