//
//  MMACommand.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/4.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 发送协议 自定义 command 必须实现
@protocol MMACommandSendable <NSObject>
@required
// command 类型
+ (NSString *)msgType;

@end

// 接收协议 自定义 command 必须实现
@protocol MMACommandReceivable <NSObject>
@required
// command 类型
+ (NSString *)msgType;
// command data解析
- (void)parseData:(NSDictionary *)data;

@end

// 自定义 command 基类
@interface MMACommand : NSObject
/*&* command 类型 */
@property (copy, nonatomic) NSString *msgType;
/*&* command 消息来源 id */
@property (copy, nonatomic) NSString *fromId;
/*&* command 消息目标 id */
@property (copy, nonatomic) NSString *toId;
/*&* command 逻辑参数 */
@property (copy, nonatomic) NSDictionary *params;
/*&* command msgId */
@property (copy, nonatomic) NSString *msgId;

/**
 实例为command model
 
 @param data json数据源
 */
- (void)fillPropertiesWithData:(NSDictionary *)data;

/**
 command model 转 json
 
 @return dict
 */
- (NSMutableDictionary *)fillDataWithProperties;

@end


