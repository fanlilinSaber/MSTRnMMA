//
//  MMAView.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAView.h"
#import <React/UIView+React.h>
#import <React/RCTView.h>
#import "MMAManager.h"
#import "MMABridgeManager.h"
#import "MMAResponseManager.h"

@implementation MMAView

- (instancetype)initWithBundleURL:(NSURL *)bundleURL
                       moduleName:(NSString *)moduleName
                initialProperties:(NSDictionary *)initialProperties
{
    return [super initWithBridge:[[MMAManager sharedInstance] bridgeFromBundleURL:bundleURL] moduleName:moduleName initialProperties:initialProperties];
}

// 取消判断，会影响RN页面的性能，
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    UIView *view = [super hitTest:point withEvent:event];
//    // 与RN如果 nativeID != nil 自己不响应
//    if ([view isKindOfClass:[RCTView class]] && !view.nativeID) {
//        return nil;
//    }
//    return view;
//}

- (void)send:(PWCommand<MMACommandSendable> *)command
{
    [(MMABridgeManager *)self.bridge send:command];
}

- (void)setResponseDelegate:(id<MMAResponseManagerDelegate>)responseDelegate
{
    self.bridge.responseManager.delegate = responseDelegate;
}

- (id<MMAResponseManagerDelegate>)responseDelegate
{
    return self.bridge.responseManager.delegate;
}

- (void)dealloc
{
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    [self.bridge invalidate];
}

@end
