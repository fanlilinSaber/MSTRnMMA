//
//  MSTARCommand.m
//  MARS
//
//  Created by Fan Li Lin on 2019/7/16.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAARCommand.h"

@implementation MMAARCommand

+ (NSString *)msgType
{
    return @"_AR_SCAN_";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.msgType = MMAARCommand.msgType;
    }
    return self;
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
