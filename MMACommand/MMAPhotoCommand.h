//
//  MMAPhotoCommand.h
//  RNTest
//
//  Created by Fan Li Lin on 2019/7/8.
//  Copyright © 2019 puwang. All rights reserved.
//

#import "MMACommand.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMAPhotoCommand : MMACommand <MMACommandSendable, MMACommandReceivable>

/*&* 拍照方式拍照有三种方式:相机拍照、屏幕截屏、播放器截帧:
 
 相机：sourceType  = camera
 屏幕截屏：sourceType  = screen
 播放器截帧: sourceType  = player
 */
@property (nonatomic, copy) NSString *sourceType;
/*&* 是否预览 */
@property (nonatomic, assign) BOOL preview;

/**
 回复给RN的拍照结果协议

 @param sourceType 图片来源
 @param image 图片
 @return MMAPhotoCommand
 */
- (instancetype)initWithSourceType:(NSString *)sourceType image:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
