//
//  MMAEmitEventManager.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAEmitEventManager.h"

@interface MMAEmitEventManager ()
/*&* 是否发送消息 */
@property (nonatomic, assign) BOOL shouldEmit;
@end

@implementation MMAEmitEventManager
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
    return YES;
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"eventEmitter"];
}

- (void)startObserving
{
    _shouldEmit = YES;
}

- (void)stopObserving
{
    _shouldEmit = NO;
}

- (void)send:(NSDictionary *)data
{
    if (_shouldEmit) {
        [self sendEventWithName:@"eventEmitter" body:data];
    }
}

- (void)dealloc
{
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}

@end

@implementation RCTBridge (MMAEmitEventManager)

- (MMAEmitEventManager *)emitEventManager
{
    return [self moduleForClass:[MMAEmitEventManager class]];
}

@end
