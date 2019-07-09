//
//  MMAPhotoCommand.m
//  RNTest
//
//  Created by Fan Li Lin on 2019/7/8.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAPhotoCommand.h"

@implementation MMAPhotoCommand

+ (NSString *)msgType
{
    return @"_PHOTOGRAPH_";
}

- (instancetype)initWithSourceType:(NSString *)sourceType image:(UIImage *)image
{
    self = [super init];
    if (self) {
        NSData *imageData = UIImageJPEGRepresentation(image, 0.8f);
        NSString *imageBase64Str = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        self.params = @{@"sourceType" : sourceType,
                        @"width" : @(image.size.width),
                        @"height" : @(image.size.height),
                        @"image": imageBase64Str
                        };
    }
    return self;
}

- (void)parseData:(NSDictionary *)data
{
    [super fillPropertiesWithData:data];
    self.sourceType = self.params[@"sourceType"];
    self.preview = [self.params[@"preview"] boolValue];
}

@end
