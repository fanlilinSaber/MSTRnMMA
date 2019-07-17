//
//  MMADataUpdateCommand.m
//  MARS
//
//  Created by Fan Li Lin on 2019/7/16.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMADataUpdateCommand.h"

@implementation MMADataUpdateCommand

+ (NSString *)msgType
{
    return @"_M3S_DATA_UPDATE_";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.msgType = MMADataUpdateCommand.msgType;
    }
    return self;
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
