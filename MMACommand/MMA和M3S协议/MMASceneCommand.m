//
//  MMASceneCommand.m
//  MARS
//
//  Created by Fan Li Lin on 2019/7/16.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMASceneCommand.h"

@implementation MMASceneCommand

+ (NSString *)msgType
{
    return @"_M3S_SCENE_DISPLAY_";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.msgType = MMASceneCommand.msgType;
    }
    return self;
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
