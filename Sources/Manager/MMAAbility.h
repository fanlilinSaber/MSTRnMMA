//
//  MMAAbility.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/4.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMACommand;

@interface MMAAbility : NSObject

/**
 解析接收的data消息 转为 command model
 
 @param data json data
 @return command model
 */
- (MMACommand *)commandWithData:(NSDictionary *)data;

/**
 注册 自定义协议的command
 
 @param aClass command实体类
 @param msgType command 的 msgType
 */
- (void)addCommand:(Class)aClass withMsgType:(NSString *)msgType;

/**
 注册 自定义协议的command，msgType默认会用aClass的msgType

 @param aClass command实体类
 */
- (void)addCommand:(Class)aClass;

@end

