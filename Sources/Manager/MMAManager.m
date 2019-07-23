//
//  MMAManager.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/5.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAManager.h"
#import <React/RCTBridge.h>
#import "MMABridgeManager.h"
#import "MMAEmitEventManager.h"
#import "MMAResponseManager.h"
#import "MMACommand.h"
#import "MMACloseCommand.h"
#import "MMAViewController.h"

@interface MMAManager () <MMADismissViewControllerDelegate>
/*&* 给RN发送消息的Manager */
@property (nonatomic, weak) MMAEmitEventManager *emitEventManager;
/*&* bridge */
@property (nonatomic, weak) RCTBridge *bridge;
/*&* MMA通信回调 */
@property (nonatomic, copy) NSDictionary *callbacks;
/*&* MMA可以关闭了回调 */
@property (nonatomic, copy) void (^complete)(void);
@end

@implementation MMAManager

+ (instancetype)sharedInstance
{
    static MMAManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MMAManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _callbacks = @{};
    }
    return self;
}

- (RCTBridge *)bridgeFromBundleURL:(NSURL *)bundleURL
{
    NSAssert(bundleURL.absoluteString != nil, @"BundleURL cannot be empty");
    // 如果加载的模块来自同一个jsbundleURL 就共用一个bridge
    RCTBridge *bridge = self.bridge;
    if (bridge == nil) {
        bridge = [[self.bridgeClass alloc] initWithBundleURL:bundleURL];
        self.bridge = bridge;
    }else {
        NSAssert(![bundleURL.absoluteString isEqualToString:bridge.bundleURL.absoluteString], @"不能同时加载不同bundleURL的模块！");
    }
    if (self.handleDelegate) {
        self.bridge.responseManager.delegate = self.handleDelegate;
    }
    return bridge;
}

- (Class)bridgeClass
{
    return [MMABridgeManager class];
}

- (instancetype)config:(MMAAbility *)ability
{
    NSAssert(ability != nil, @"Ability cannot be empty");
    _ability = ability;
    return self;
}

- (void)send:(PWCommand<MMACommandSendable> *)command
{
    if (self.bridge == nil) {
        return;
    }
    [(MMABridgeManager *)self.bridge send:command];
}

- (void)addCallback:(id)callback withCallbackId:(NSString *)callbackId
{
    NSMutableDictionary *callbacks = [self.callbacks mutableCopy];
    callbacks[callbackId] = callback;
    self.callbacks = callbacks;
}

- (void)send:(PWCommand<MMACommandSendable> *)command withCallbackId:(NSString *)callbackId
{
    if (!callbackId) {
        [self send:command];
    }else {
        RCTResponseSenderBlock callback = self.callbacks[callbackId];
        if (callback) {
            NSDictionary *data = command.fillDataWithProperties;
#ifdef DEBUG
            NSLog(@"\n回调给RN消息:\n%@", data);
#endif
            callback(@[data]);
            NSMutableDictionary *callbacks = [self.callbacks mutableCopy];
            [callbacks removeObjectForKey:callbackId];
            self.callbacks = callbacks;
        }
    }
}

- (void)closeViewControllerAnimated:(BOOL)flag complete:(void (^)(void))complete
{
    self.complete = [complete copy];
    // IOS调用关闭重新页面回调关闭代理
    self.bridge.responseManager.dismissDelegate = self;
    // send
    MMACloseCommand *command = [MMACloseCommand new];
    [self send:command];
}

#pragma mark - MMADismissViewControllerDelegate

- (void)dismissViewController
{
    if (self.complete) {
        self.complete();
    }else {
        NSArray *weakValue = [self.bridge viewControllers];
        for (NSValue *value in weakValue) {
            [(MMAViewController *)value.nonretainedObjectValue dismissViewController];
        }
        weakValue = nil;
    }
    self.bridge.responseManager.dismissDelegate = nil;
}

@end
