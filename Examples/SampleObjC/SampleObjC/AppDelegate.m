//
//  AppDelegate.m
//  SampleObjC
//
//  Created by Pallab Maiti on 20/09/23.
//

#import "AppDelegate.h"
#import <Rudder/Rudder.h>
#import "SampleObjC-Swift.h"

@import RudderDatabaseEncryption;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RudderConfig" ofType:@"plist"];
    if (path != nil) {
        NSURL *url = [NSURL fileURLWithPath:path];
        RudderConfig *rudderConfig = [RudderConfig createFrom:url];
        NSLog(@"------%@------", NSHomeDirectory());
        if (rudderConfig != nil) {
            RSConfigBuilder *builder = [[RSConfigBuilder alloc] init];
            [builder withLoglevel:RSLogLevelVerbose];
            [builder withTrackLifecycleEvens:YES];
            [builder withCollectDeviceId:NO];
            [builder withRecordScreenViews:YES];
            [builder withDataPlaneUrl:rudderConfig.DEV_DATA_PLANE_URL];
            [builder withControlPlaneUrl:rudderConfig.DEV_CONTROL_PLANE_URL];
            [builder withDBEncryption:[[RSDBEncryption alloc] initWithKey:@"test1234" enable:YES databaseProvider:[RSEncryptedDatabaseProvider new]]];
            [RSClient getInstance:rudderConfig.WRITE_KEY config:[builder build]];
        }
    }

    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
