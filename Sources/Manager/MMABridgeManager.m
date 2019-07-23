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

@interface MMABridgeManager ()
@property (nonatomic, copy) NSArray *aViewControllers;
@end

@implementation MMABridgeManager

- (instancetype)initWithBundleURL:(NSURL *)bundleURL
{
    self.aViewControllers = @[];
    return [super initWithDelegate:[[[BridgeHandle alloc] init] initWithBundleURL:bundleURL] launchOptions:nil];
}

- (void)send:(PWCommand<MMACommandSendable> *)command
{
    NSDictionary *data = command.fillDataWithProperties;
#ifdef DEBUG
    NSLog(@"\n给RN发送协议:\n%@", data);
#else
#endif
    [self.emitEventManager send:data];
}

#pragma mark - MMAViewController

- (NSArray<NSValue *> *)viewControllers
{
    return self.aViewControllers;
}

- (void)addViewController:(MMAViewController *)viewController
{
    NSMutableArray *aViewControllers = [self.aViewControllers mutableCopy];
    // 用NSValue来包装可以代替 weak 在数组中弱引用，避免内存泄露
    NSValue *value = [NSValue valueWithNonretainedObject:viewController];
    [aViewControllers addObject:value];
    self.aViewControllers = aViewControllers;
}

- (void)dealloc
{
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}

@end
