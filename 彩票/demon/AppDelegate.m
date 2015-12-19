//
//  AppDelegate.m
//  demon
//
//  Created by 吴洋 on 15/11/21.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "AppDelegate.h"
#import "DKmainBarVc.h"
#import "DKGuideVc.h"


@interface AppDelegate ()

@end

@implementation AppDelegate



- (void)chooseVc{
    
    NSString *guideVc = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];

    NSString *tarVc = [def objectForKey:@"tarVc"];
    
    if ([guideVc isEqualToString:tarVc]) {
        DKmainBarVc *tabVc=[DKmainBarVc initMainVc];
        
        self.window.rootViewController=tabVc;

    }else{
    
        DKGuideVc *guideVc=[[DKGuideVc alloc]init];
        

        self.window.rootViewController=guideVc;
        

    
    }


    [def setObject:guideVc forKey:@"tarVc"];
    [def synchronize];


}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    //判断启动Vc
    
    [self chooseVc];
    

    
    [self.window makeKeyAndVisible];

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
