//
//  MMAViewController.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAViewController.h"
#import "MMAView.h"
#import "MMAResponseManager.h"
#import "MMABridgeManager.h"

@interface MMAViewController () <MMADismissViewControllerDelegate>
/*&* mainView */
@property (nonatomic, strong) MMAView *mainView;
@end

@implementation MMAViewController

- (instancetype)initWithBundleURL:(NSURL *)bundleURL
                       moduleName:(NSString *)moduleName
                initialProperties:(NSDictionary *)initialProperties
{
    self = [super init];
    if (self) {
        self.mainView = [[MMAView alloc] initWithBundleURL:bundleURL moduleName:moduleName initialProperties:initialProperties];
        self.mainView.bridge.responseManager.dismissDelegate = self;
        [self.mainView.bridge addViewController:self];
    }
    return self;
}

- (void)loadView
{
    self.view = self.mainView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)send:(MMACommand<MMACommandSendable> *)command
{
    [self.mainView send:command];
}

- (id<MMAResponseManagerDelegate>)responseDelegate
{
    return [self.mainView responseDelegate];
}

- (void)setResponseDelegate:(id<MMAResponseManagerDelegate>)responseDelegate
{
    self.mainView.responseDelegate = responseDelegate;
}

#pragma mark - MMADismissViewControllerDelegate

- (void)dismissViewController
{
    if (self.presentingViewController == nil &&
        !self.isBeingDismissed &&
        self.view.window) {
        [self.navigationController popViewControllerAnimated:NO];
    } else {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)dealloc
{
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}

@end

