//
//  AppDelegate.m
//  BHCoreDataPropertyDemo
//
//  Created by QBH on 2019/1/23.
//  Copyright © 2019 YiBeiKeJi. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self configureCoreData];
	
	return YES;
}

#pragma mark - Private Methods

- (void)configureCoreData {
	[MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelDebug];
	[MagicalRecord setShouldAutoCreateManagedObjectModel:NO];
	
	NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"BHCoreDataPropertyDemo" withExtension:@"momd"];
	NSManagedObjectModel *objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
	[NSManagedObjectModel MR_setDefaultManagedObjectModel:objectModel];
	[MagicalRecord setShouldDeleteStoreOnModelMismatch:YES];
	[MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"BHCoreDataPropertyDemo.sqlite"];
}

@end
