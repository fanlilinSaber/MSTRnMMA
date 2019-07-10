//
//  MMABridgeManager.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMABridgeManager.h"
#import <React/RCTBundleURLProvider.h>
#import "MMAEmitEventManager.h"
#import "MMACommand.h"

/**
 自定义类，实现RCTBridgeDelegate
 */
@interface BridgeHandle : NSObject<RCTBridgeDelegate>
@property (nonatomic, strong) NSURL *bundleURL;
@end

@implementation BridgeHandle

- (instancetype)initWithBundleURL:(NSURL *)bundleURL
{
    if (self = [super init]) {
        self.bundleURL = bundleURL;
    }
    return self;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    return self.bundleURL;
}

@end

@implementation MMABridgeManager

- (instancetype)initWithBundleURL:(NSURL *)bundleURL
{
    return [super initWithDelegate:[[[BridgeHandle alloc] init] initWithBundleURL:bundleURL] launchOptions:nil];
}

- (void)send:(MMACommand<MMACommandSendable> *)command
{
    NSDictionary *data = command.fillDataWithProperties;
#ifdef DEBUG
    NSLog(@"\n给RN发送协议:\n%@", data);
#else
#endif
    [self.emitEventManager send:data];
}

@end
