//
//  MMAViewController.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMACommandSendable, MMAResponseManagerDelegate;
@class MMACommand;

@interface MMAViewController : UIViewController

@property (weak, nonatomic) id<MMAResponseManagerDelegate> responseDelegate;

- (instancetype)initWithBundleURL:(NSURL *)bundleURL
                       moduleName:(NSString *)moduleName
                initialProperties:(NSDictionary *)initialProperties;

/**
 发送消息
 
 @param command custom MMACommand
 */
- (void)send:(MMACommand<MMACommandSendable> *)command;

- (void)dismissViewController;

@end

