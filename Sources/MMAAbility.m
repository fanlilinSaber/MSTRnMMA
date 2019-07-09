//
//  MMAAbility.m
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/4.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMAAbility.h"
#import "MMACommand.h"

@interface MMAAbility ()
/*&* 自定义协议的command class 类 */
@property (copy, nonatomic) NSDictionary *commands;
@end

@implementation MMAAbility

#pragma mark - init Method

- (instancetype)init
{
    self = [super init];
    if (self) {
        _commands = @{};
    }
    return self;
}

- (MMACommand *)commandWithData:(NSDictionary *)data
{
    NSString *msgType = data[@"msgType"];
    if (!msgType) {
        return nil;
    }else {
        Class class = (Class)self.commands[msgType];
        MMACommand<MMACommandReceivable> *command = [class new];
        [command parseData:data];
        return command;
    }
}

- (void)addCommand:(Class)aClass withMsgType:(NSString *)msgType
{
    NSAssert([aClass isSubclassOfClass:MMACommand.class], @"Command Must Inherited From MMCommand");
    NSAssert([aClass conformsToProtocol:@protocol(MMACommandReceivable)], @"Command Must Conform To MMACommandReceivable");
    NSAssert(self.commands[msgType] == nil, @"Command Already Existed");
    NSMutableDictionary *commands = [self.commands mutableCopy];
    commands[msgType] = aClass;
    self.commands = commands;
}

- (void)addCommand:(Class)aClass
{
    NSString *msgType = [aClass msgType];
    [self addCommand:aClass withMsgType:msgType];
}

@end
