//
//  Fingerprint.m
//  ATSTest
//
//  Created by Wu Wei on 2017/01/17.
//  Copyright © 2017年 CyberZ. All rights reserved.
//

#import "Fingerprint.h"

@implementation Fingerprint {
    UIWebView* _webView;
}

-(void)load:(NSUInteger) tag {
    NSLog(@"load webView");
    _webView = [UIWebView new];
    _webView.tag = tag;
    _webView.delegate = self;

    NSString* urlString = @"https://test.catchy-creator.me/";
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* req = [NSURLRequest requestWithURL:url];

    [_webView loadRequest:req];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad %@ [%ld]", webView.request.URL.absoluteString, (long)webView.tag);
}

-(void) webView:(UIWebView *) webView didFailLoadWithError:(NSError *) error {
    NSLog(@"WebView didFailLoadWithError %@", error);
}

@end
