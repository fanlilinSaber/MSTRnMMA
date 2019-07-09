//
//  MSTRNViewController.m
//  MSTRnMMA IOS Example
//
//  Created by Fan Li Lin on 2019/7/8.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MSTRNViewController.h"
#import "MSTRnMMA.h"
#import "MMAQRCommand.h"
#import "MMAPhotoCommand.h"
#import "MMASceneCommand.h"
#import "MSTScanViewController.h"

@interface MSTRNViewController () <MMAResponseManagerDelegate>

@end

@implementation MSTRNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.responseDelegate = self;
    
    MMAAbility *ability = [MMAAbility new];
    [ability addCommand:[MMAQRCommand class]];
    [ability addCommand:[MMAPhotoCommand class]];
    [ability addCommand:[MMASceneCommand class]];
    [[MMAManager sharedInstance] config:ability];
}

//- (void)didReceiveCommand:(MMACommand *)command callback:(void (^)(NSArray *))callback
//{
//    NSLog(@"\nmsgType = %@\nresponseData = %@",command.msgType, command.params);
//    // 二维码
//    if ([command.msgType isEqualToString:MMAQRCommand.msgType]) {
//        [self pushScanViewControllerCallback:callback];
//    }
//    // 拍照
//    else if ([command.msgType isEqualToString:MMAPhotoCommand.msgType]) {
//
//    }
//    // 加载场景
//    else if ([command.msgType isEqualToString:MMASceneCommand.msgType]) {
//
//    }
//    if (callback) {
//        NSLog(@"有回调");
//    }else {
//        NSLog(@"没有有回调");
//    }
//}

- (void)didReceiveCommand:(MMACommand *)command callbackId:(NSString *)callbackId
{
    NSLog(@"\nmsgType = %@\nresponseData = %@",command.msgType, command.params);
    // 二维码
    if ([command.msgType isEqualToString:MMAQRCommand.msgType]) {
        [self pushScanViewControllerWithCallbackId:callbackId];
    }
    // 拍照
    else if ([command.msgType isEqualToString:MMAPhotoCommand.msgType]) {
        [self screenshotWithCallbackId:callbackId];
    }
    // 加载场景
    else if ([command.msgType isEqualToString:MMASceneCommand.msgType]) {
        
    }
    if (callbackId) {
        NSLog(@"有回调");
    }else {
        NSLog(@"没有有回调");
    }
}


- (void)pushScanViewControllerWithCallbackId:(NSString *)callbackId
{
    MSTScanViewController *vc = [MSTScanViewController new];
    vc.blockForScanResult = ^(NSString * _Nonnull result) {
        MMAQRCommand *commmand = [[MMAQRCommand alloc] initWithContent:result];
        [[MMAManager sharedInstance] send:commmand callbackId:callbackId];
    };
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
}

- (void)screenshotWithCallbackId:(NSString *)callbackId
{
    UIImage *image = ScreenshotImage();
    MMAPhotoCommand *commmand = [[MMAPhotoCommand alloc] initWithSourceType:@"screen" image:image];
    [[MMAManager sharedInstance] send:commmand callbackId:callbackId];
}

UIImage *ScreenshotImage()
{
    UIScreen *mainScreen = [UIScreen mainScreen];
    CGSize imageSize = mainScreen.bounds.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        if (![window respondsToSelector:@selector(screen)] || window.screen == mainScreen) {
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, window.center.x, window.center.y);
            CGContextConcatCTM(context, [window transform]);
            CGContextTranslateCTM(context,
                                  -window.bounds.size.width * window.layer.anchorPoint.x,
                                  -window.bounds.size.height * window.layer.anchorPoint.y);
            if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
                [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
            }else {
                [window.layer renderInContext:context];
            }
            CGContextRestoreGState(context);
        }
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
