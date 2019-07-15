//
//  MMAResponseManager.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAResponseManager.h"
#import "MMAAbility.h"
#import "MMAManager.h"
#import "MMACloseRequestCommand.h"

@implementation MMAResponseManager
// 注册模块
RCT_EXPORT_MODULE();

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_queue_create([@"com.mst.mma.response.command.queue" cStringUsingEncoding:NSUTF8StringEncoding], DISPATCH_QUEUE_SERIAL);
}

#pragma mark -- API

RCT_EXPORT_METHOD(responseMsgType:(NSString *)msgType responseData:(NSDictionary *)data)
{
    NSLog(@"\n收到RN消息了\nmsgType = %@\nresponseData = %@\ncurrentThread = %@",msgType, data, [NSThread currentThread]);
    [self responseMsgType:msgType responseData:data callback:nil];
}

RCT_EXPORT_METHOD(callbackResponseMsgType:(NSString *)msgType responseData:(NSDictionary *)data callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"\n收到RN(回调)消息了\nmsgType = %@\nresponseData = %@\ncallback = %@\ncurrentThread = %@",msgType, data, callback, [NSThread currentThread]);
    [self responseMsgType:msgType responseData:data callback:callback];
}

- (void)responseMsgType:(NSString *)msgType responseData:(NSDictionary *)data callback:(RCTResponseSenderBlock)callback
{
    MMACommand *command = (MMACommand *)[[MMAManager sharedInstance].ability commandWithJson:data];
    if (command) {
        // 关闭MMA页面
        if ([command.msgType isEqualToString:[MMACloseRequestCommand msgType]]) {
            // send delegate
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.dismissDelegate dismissViewController];
            });
        }else if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(didReceiveCommand:callbackId:)]) {
                // 有回调
                if (callback) {
                    // add callback
                    NSString *callbackId = [self.class callbackId];
                    [[MMAManager sharedInstance] addCallback:callback withCallbackId:callbackId];
                    // send delegate
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.delegate didReceiveCommand:command callbackId:callbackId];
                    });
                }else {
                    // send delegate
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.delegate didReceiveCommand:command callbackId:nil];
                    });
                }
            }
            else if ([self.delegate respondsToSelector:@selector(didReceiveCommand:callback:)]) {
                // send delegate
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.delegate didReceiveCommand:command callback:callback];
                });
            }
        }
    }
}

+ (NSString *)callbackId
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    // 去除UUID ”-“
    NSString *UUID = [[uuid lowercaseString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return UUID;
}

- (void)dealloc
{
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}

@end

@implementation RCTBridge (MMAResponseManager)

- (MMAResponseManager *)responseManager
{
    return [self moduleForClass:[MMAResponseManager class]];
}

@end
