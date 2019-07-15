//
//  MMACloseRequestCommand.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/11.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMACloseRequestCommand.h"

@implementation MMACloseRequestCommand

+ (NSString *)msgType
{
    return @"_MMA_CLOSE_REQUEST_";
}

// command data解析
- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
