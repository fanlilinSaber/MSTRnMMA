//
//  MMACloseRequestCommand.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/11.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMACommand.h"

NS_ASSUME_NONNULL_BEGIN

// MMA 主动关闭页面协议
@interface MMACloseRequestCommand : MMACommand <MMACommandReceivable>

@end

NS_ASSUME_NONNULL_END
