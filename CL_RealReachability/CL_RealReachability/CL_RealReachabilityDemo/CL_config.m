//
//  CL_config.m
//  CL_RealReachability
//
//  Created by nst on 2018/7/26.
//  Copyright © 2018年 nst. All rights reserved.
//

#import "CL_config.h"
static CL_config * instance = nil;
@implementation CL_config

+(instancetype)instance
{
    if(instance == nil)
    {
        instance = [[CL_config alloc] init];
    }
    
    return instance;
}

/**
 网络状态变化
 */
-(void)realReachability{

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkChanged:)
                                                 name:kRealReachabilityChangedNotification
                                               object:nil];
    ReachabilityStatus status = [[RealReachability sharedInstance] currentReachabilityStatus];
    if (status!=0) {
        self.isNet = YES;
    }
}
- (void)networkChanged:(NSNotification *)notification
{
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    NSLog(@"currentStatus:%@",@(status));
    
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        switch (status)
        {
            case RealStatusNotReachable:
            {
                self.isNet = NO;
                //  case NotReachable handler
                break;
            }
                
            case RealStatusViaWiFi:
            {
                self.isNet = YES;
                if (self.change_net_block) {
                    self.change_net_block();
                }
                break;
            }
                
            case RealStatusViaWWAN:
            {
                self.isNet = YES;
                if (self.change_net_block) {
                    self.change_net_block();
                }
                break;
            }
                
            default:{
                self.isNet = YES;
                if (self.change_net_block) {
                    self.change_net_block();
                }
            }
                break;
                
        }
    }];
}

@end
