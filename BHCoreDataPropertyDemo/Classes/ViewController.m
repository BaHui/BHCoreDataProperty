//
//  ViewController.m
//  BHCoreDataPropertyDemo
//
//  Created by QBH on 2019/1/23.
//  Copyright © 2019 YiBeiKeJi. All rights reserved.
//

#import "ViewController.h"
#import "BHPerson+DataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self savePersonData];
}

#pragma mark - Private Methods

- (void)savePersonData {
	NSDictionary *personData = @{@"name" : @"qiaobahui",  @"language" : @"english"};
	[BHPerson createOrUpdateByDictionaryData:personData completion:^(BOOL success, NSError * _Nonnull error) {
		NSLog(@"SAVE SUCCEED!");
	}];
}

- (void)fetchPersonData {
	BHPerson *peron = [BHPerson current];
	NSLog(@"name: %@", peron.name);
	NSLog(@"language: %@", peron.language);
	/* 输出: name: qiaobahui
	 language: english/changed
	 */
}

#pragma mark - UITouch Methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[self fetchPersonData];
}

@end
