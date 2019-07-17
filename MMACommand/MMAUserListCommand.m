//
//  MMAUserListCommand.m
//  MARS
//
//  Created by Fan Li Lin on 2019/7/16.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAUserListCommand.h"

@implementation MMAUserListCommand

+ (NSString *)msgType
{
    return @"_NET_USER_LIST_";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.msgType = MMAUserListCommand.msgType;
    }
    return self;
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
