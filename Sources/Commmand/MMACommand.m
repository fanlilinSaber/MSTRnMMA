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

- (id)mutableCopyWithZone:(NSZone *)zone
{
    MMACommand *command = [[[self class] allocWithZone:zone] init];
    command.msgType = self.msgType;
    command.fromId = self.fromId;
    command.toId = self.toId;
    command.params = self.params;
    command.paramsArray = self.paramsArray;
    command.msgId = self.msgId;
    command.enabledAck = self.enabledAck;
    command.serialNo = self.serialNo;
    return command;
}

@end
