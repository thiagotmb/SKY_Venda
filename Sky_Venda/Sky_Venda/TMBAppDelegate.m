//
//  TMBAppDelegate.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/5/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBAppDelegate.h"
#import "TMBSignatureSingleton.h"
#import "TMBFaqSingleton.h"
#import "TMBPackageSingleton.h"
#import "TMBEnterpriseContactSingleton.h"


@implementation TMBAppDelegate{
    
    TMBSignatureSingleton *sharedSignature;
    TMBFaqSingleton *sharedFaqList;
    TMBPackageSingleton *sharedPackageList;
    TMBEnterpriseContactSingleton *sharedEnterpriseContact;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    sharedSignature = [TMBSignatureSingleton sharedData];
    sharedFaqList = [TMBFaqSingleton sharedData];
    sharedPackageList = [TMBPackageSingleton sharedData];
    sharedEnterpriseContact = [TMBEnterpriseContactSingleton sharedData];

    
    [sharedSignature loadSharedData];
    [sharedFaqList loadSharedData];
    [sharedPackageList loadSharedData];
    [sharedEnterpriseContact loadSharedData];


    [sharedPackageList requestPackageList];
    [sharedEnterpriseContact requestContactInfo];
    

    UIImage *navigationBarImage = [UIImage imageNamed:@"NavigationBar.png"];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithHue:0 saturation:1 brightness:0.5 alpha:1]];
    [[UINavigationBar appearance]
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHue:0 saturation:1 brightness:0.5 alpha:1]}];
    [[UINavigationBar appearance] setBackgroundImage:navigationBarImage forBarMetrics:UIBarMetricsDefault];
    
    UIImage *tabBarImage = [UIImage imageNamed:@"TabBar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarImage];
    
    
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor colorWithHue:359 saturation:100 brightness:50 alpha:1];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [sharedSignature saveSharedData];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [sharedSignature loadSharedData];
    [sharedFaqList loadSharedData];
    //[sharedPackageList loadSharedData];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [sharedSignature saveSharedData];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
