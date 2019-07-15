//
//  MMACommand.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/4.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMACommand.h"

@implementation MMACommand

#pragma mark - public Method

- (void)fillPropertiesWithData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
    self.serialNo = [data[@"serialNo"] intValue];
}

- (NSMutableDictionary *)fillDataWithProperties
{
    NSMutableDictionary *data = [super fillDataWithProperties];
    if (self.serialNo != 0) {
        data[@"serialNo"] = @(self.serialNo);
    }
    return data;
}

@end
