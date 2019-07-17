//
//  MMAEventCommand.m
//  MARS
//
//  Created by Fan Li Lin on 2019/7/16.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAEventCommand.h"

@implementation MMAEventCommand

+ (NSString *)msgType
{
    return @"_M3S_MMA_EVENT_";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.msgType = MMAEventCommand.msgType;
    }
    return self;
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
