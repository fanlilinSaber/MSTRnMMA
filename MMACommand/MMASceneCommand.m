//
//  MMASceneCommand.m
//  RNTest
//
//  Created by Fan Li Lin on 2019/7/8.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMASceneCommand.h"

@implementation MMASceneCommand

+ (NSString *)msgType
{
    return @"_SCENE_DISPLAY_";
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
