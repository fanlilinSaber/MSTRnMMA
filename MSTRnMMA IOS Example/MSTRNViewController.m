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
#import "MMAARCommand.h"
#import "MMAMRCoopCommand.h"
#import "MMAUserListCommand.h"
#import "MMAPhotoCommand.h"
#import "MMASceneCommand.h"
#import "MMAEventCommand.h"
#import "MMADataUpdateCommand.h"
#import "MSTScanViewController.h"
#import "UIViewController+BackButtonHandler.h"

@interface MSTRNViewController () <MMAResponseManagerDelegate>
/*&* 消息是U3D处理的msgType */
@property (nonatomic, copy) NSArray <NSString *>*supportedU3DEvents;
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

- (BOOL)navigationShouldPopOnBackButton
{
    [[MMAManager sharedInstance] closeViewControllerAnimated:YES complete:nil];
    return NO;
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

#pragma mark - MMAResponseManagerDelegate protocol

- (void)didReceiveCommand:(MMACommand *)command callbackId:(NSString *)callbackId
{
    NSLog(@"\nmsgType = %@\nresponseData = %@",command.msgType, command.params);
    if ([self.supportedU3DEvents containsObject:command.msgType]) {
        
        // send to U3D

    }else {
        // 二维码
        if ([command.msgType isEqualToString:MMAQRCommand.msgType]) {
            [self pushScanViewControllerWithCallbackId:callbackId];
        }
        // 拍照
        else if ([command.msgType isEqualToString:MMAPhotoCommand.msgType]) {
            [self photoWithSourceType:((MMAPhotoCommand *)command).sourceType preview:((MMAPhotoCommand *)command).preview callbackId:callbackId];
        }
        // AR扫描
        else if ([command.msgType isEqualToString:MMAARCommand.msgType]) {
            
        }
        // 获取用户列表
        else if ([command.msgType isEqualToString:MMAUserListCommand.msgType]) {
            [self userListWithCallbackId:callbackId];
        }
        // MR协作
        else if ([command.msgType isEqualToString:MMAMRCoopCommand.msgType]) {
            [self remoteAssistanceWithCallbackId:callbackId];
        }
        
        if (callbackId) {
            NSLog(@"有回调");
        }else {
            NSLog(@"没有有回调");
        }
    }
}

- (void)dispenseToU3DWithCommand:(MMACommand *)command
{
    
}


- (void)pushScanViewControllerWithCallbackId:(NSString *)callbackId
{
    MSTScanViewController *vc = [MSTScanViewController new];
    vc.blockForScanResult = ^(NSString * _Nonnull result) {
        MMAQRCommand *commmand = [[MMAQRCommand alloc] initWithContent:result];
        [[MMAManager sharedInstance] send:commmand withCallbackId:callbackId];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)photoWithSourceType:(NSString *)sourceType preview:(BOOL)preview callbackId:(NSString *)callbackId
{
    UIImage *image = ScreenshotImage();
    MMAPhotoCommand *commmand = [[MMAPhotoCommand alloc] initWithSourceType:@"screen" image:image];
    [[MMAManager sharedInstance] send:commmand withCallbackId:callbackId];
}

- (void)userListWithCallbackId:(NSString *)callbackId
{
    
}

- (void)remoteAssistanceWithCallbackId:(NSString *)callbackId
{
    
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


- (NSArray *)supportedU3DEvents
{
    return @[MMASceneCommand.msgType,
             MMAEventCommand.msgType,
             MMADataUpdateCommand.msgType];
}

@end
