//
//  MMAQRCommand.h
//  RNTest
//
//  Created by Fan Li Lin on 2019/7/8.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMACommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface MMAQRCommand : MMACommand <MMACommandSendable, MMACommandReceivable>

/**
 回复给RN的二维码识别协议

 @param content 识别的内容
 @return MMAQRCommand
 */
- (instancetype)initWithContent:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
