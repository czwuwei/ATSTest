//
//  ViewController.m
//  ATSTest
//
//  Created by Wu Wei on 2017/01/17.
//  Copyright © 2017年 CyberZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"WebView fail load %@", error);
}

@end
