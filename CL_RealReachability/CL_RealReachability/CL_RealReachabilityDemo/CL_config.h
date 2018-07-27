//
//  CL_config.h
//  CL_RealReachability
//
//  Created by nst on 2018/7/26.
//  Copyright © 2018年 nst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealReachability.h"
typedef void(^changeNetBlock)(void);
@interface CL_config : NSObject
/**
 网络变回回调block
 */
@property (strong,nonatomic) changeNetBlock change_net_block;
/**
 是否有网
 */
@property (nonatomic,assign) BOOL isNet;
/**
 网络状态变化
 */
-(void)realReachability;
+(instancetype)instance;
@end
