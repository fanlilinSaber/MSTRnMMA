//
//  MSTScanViewController.h
//  MSTRnMMA IOS Example
//
//  Created by Fan Li Lin on 2019/7/9.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSTScanViewController : UIViewController
/*&* <##> */
@property (nonatomic, copy) void(^blockForScanResult)(NSString *result);
@end

NS_ASSUME_NONNULL_END
