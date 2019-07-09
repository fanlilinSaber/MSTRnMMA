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
    self.msgType = data[@"msgType"];
    self.params = data[@"params"];
    self.msgId = data[@"msgId"];
}

- (NSMutableDictionary *)fillDataWithProperties
{
    NSMutableDictionary *data = [NSMutableDictionary new];
    data[@"msgType"] = [self.class msgType];
    data[@"params"] = self.params;
    data[@"msgId"] = self.msgId;
    return data;
}

@end
