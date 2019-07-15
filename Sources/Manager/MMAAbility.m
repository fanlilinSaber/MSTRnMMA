//
//  MMAAbility.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/4.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAAbility.h"
#import "MMACommand.h"
#import "MMACloseCommand.h"
#import "MMACloseRequestCommand.h"

@interface MMAAbility ()
/*&* 自定义协议的command class 类 */
@property (copy, nonatomic, readwrite) NSDictionary *commands;
@end

@implementation MMAAbility

@dynamic commands;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.commands = @{};
        self.commands = @{MMACloseRequestCommand.msgType: MMACloseRequestCommand.class,
                          MMACloseCommand.msgType: MMACloseCommand.class
                          };
    }
    return self;
}

@end
