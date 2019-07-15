//
//  MMACommand.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/4.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Pineapple/PWCommand.h>

// 发送协议 自定义 command 必须实现
@protocol MMACommandSendable <PWCommandSendable>

@end

// 接收协议 自定义 command 必须实现
@protocol MMACommandReceivable <PWCommandReceivable>

@end

// 自定义 command 基类
@interface MMACommand : PWCommand
/*&* 消息系列ID */
@property (assign, nonatomic) int serialNo;

@end


