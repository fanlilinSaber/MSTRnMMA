//
//  MMAMRCoopCommand.m
//  MARS
//
//  Created by Fan Li Lin on 2019/7/16.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAMRCoopCommand.h"

@implementation MMAMRCoopCommand

+ (NSString *)msgType
{
    return @"_MR_COOP_";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.msgType = MMAMRCoopCommand.msgType;
    }
    return self;
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
