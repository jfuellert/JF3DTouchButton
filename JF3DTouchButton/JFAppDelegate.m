//
//  JFAppDelegate.m
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "JFAppDelegate.h"
#import "JFRootViewController.h"

@implementation JFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    JFRootViewController *rootViewController = [[JFRootViewController alloc] init];
    self.window.rootViewController           = rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end