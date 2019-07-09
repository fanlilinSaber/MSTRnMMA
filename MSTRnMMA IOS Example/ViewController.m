//
//  ViewController.m
//  MSTRnMMA IOS Example
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "ViewController.h"
#import "MSTRnMMA.h"
#import "MSTRNView.h"
#import "MSTRNViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"main.jsbundle" ofType:nil inDirectory:@"Resource"];
//    NSURL *jsCodeLocation = [NSURL fileURLWithPath:filePath];
//    MSTRNView *rnView = [[MSTRNView alloc] initWithBundleURL:jsCodeLocation moduleName:@"MMAJSBase" initialProperties:nil];
//    rnView.frame = self.view.frame;
//    [self.view addSubview:rnView];
}

- (IBAction)pushRnVc:(UIButton *)sender
{
//    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.0.118:8081/index.bundle?platform=ios"];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index.ios2.jsbundle" ofType:nil inDirectory:@"Resource"];
    NSURL *jsCodeLocation = [NSURL fileURLWithPath:filePath];
    
    MSTRNViewController *vc = [[MSTRNViewController alloc] initWithBundleURL:jsCodeLocation moduleName:@"MMAJSBase" initialProperties:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
