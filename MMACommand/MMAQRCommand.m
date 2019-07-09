//
//  MMAQRCommand.m
//  RNTest
//
//  Created by Fan Li Lin on 2019/7/8.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAQRCommand.h"

@implementation MMAQRCommand

+ (NSString *)msgType
{
    return @"_QR_SCAN_";
}

- (instancetype)initWithContent:(NSString *)content
{
    self = [super init];
    if (self) {
        self.params = @{@"content" : content};
    }
    return self;
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
}

@end
