//
//  MMAAbility.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/4.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Pineapple/PWAbility.h>

@interface MMAAbility : PWAbility
/*&* 自定义协议的command class 类 */
@property (copy, nonatomic, readonly) NSDictionary *commands;
@end

