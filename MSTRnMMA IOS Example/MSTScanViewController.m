//
//  MSTScanViewController.m
//  MSTRnMMA IOS Example
//
//  Created by Fan Li Lin on 2019/7/9.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MSTScanViewController.h"
#import "UIViewController+BackButtonHandler.h"

@interface MSTScanViewController ()

@end

@implementation MSTScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"扫描二维码";
}

- (BOOL)navigationShouldPopOnBackButton
{
    if (self.blockForScanResult) {
        self.blockForScanResult(@"123456");
    }
    return YES;
}

@end
