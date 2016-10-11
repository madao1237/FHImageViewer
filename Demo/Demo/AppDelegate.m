//
//  AppDelegate.m
//  Demo
//
//  Created by MADAO on 16/10/9.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreText/CoreText.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSMutableDictionary *fontAttrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"PingFangSC", kCTFontNameAttribute, nil];
    CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)fontAttrs);
    NSMutableArray *descArray = [NSMutableArray new];
    [descArray addObject:(__bridge id)desc];
    CFRelease(desc);
    //封装成一个CF的字体对象
    
    //将对象传入，进行下载
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler((__bridge CFArrayRef)descArray, NULL, ^bool(CTFontDescriptorMatchingState state, CFDictionaryRef  _Nonnull progressParameter) {
        NSDictionary *progressDic = (__bridge NSDictionary *)progressParameter;
        NSLog(@"state: %u",state);
        NSLog(@"progress: %@",progressDic);
        return YES;
    });
    NSLog(@"=======%@",[UIFont fontNamesForFamilyName:@"PingFangSC"]);
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


@end