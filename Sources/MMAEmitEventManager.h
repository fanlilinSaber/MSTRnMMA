//
//  MMAEmitEventManager.h
//  MSTRnMMA
//
//  Created by Fan Li Lin on 2019/7/3.
//  Copyright © 2019 puwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMAEmitEventManager : RCTEventEmitter

- (void)send:(NSDictionary *)data;

@end

@interface RCTBridge (MMAEmitEventManager)

- (MMAEmitEventManager *)emitEventManager;

@end

NS_ASSUME_NONNULL_END
