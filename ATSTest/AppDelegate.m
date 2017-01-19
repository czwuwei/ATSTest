//
//  AppDelegate.m
//  ATSTest
//
//  Created by Wu Wei on 2017/01/17.
//  Copyright © 2017年 CyberZ. All rights reserved.
//

#import "AppDelegate.h"
#import "Fingerprint.h"

@interface AppDelegate ()<NSURLConnectionDataDelegate>

@end

@implementation AppDelegate {
    Fingerprint* fp;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString* tmckUrl = @"https://test.catchy-creator.me/";

    NSURLRequest* tmckReq = [NSURLRequest requestWithURL:[NSURL URLWithString:tmckUrl]];

    [NSURLConnection connectionWithRequest:tmckReq delegate:self];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection didFailWithError %@", error);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"from [%@] didReceiveData %@", connection.originalRequest.URL.absoluteString, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading %@", connection.originalRequest.URL.absoluteString);

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"sleeping...");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"awake!");
        dispatch_async(dispatch_get_main_queue(), ^{
            fp = [Fingerprint new];
            [fp load:1];
        });
    });

}


@end
