//
//  ViewController.m
//  CL_RealReachability
//
//  Created by nst on 2018/7/26.
//  Copyright © 2018年 nst. All rights reserved.
//

#import "ViewController.h"
#import "CL_config.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *textLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest *request =  [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.webView loadRequest:request];
    // Do any additional setup after loading the view, typically from a nib.
    [CL_config instance].change_net_block = ^{
        if ([CL_config instance].isNet) {
            self.textLable.text = @"有网络";
        }else{
            self.textLable.text = @"没有网络";
        }
        
        
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
