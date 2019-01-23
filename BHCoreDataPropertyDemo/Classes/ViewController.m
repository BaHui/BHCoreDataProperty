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
	NSDictionary *personData = @{@"name" : @"qiaobahui",
															 @"language" : @"english"
															 };
	
	[BHPerson createOrUpdateByDictionaryData:personData completion:^(BOOL success, NSError * _Nonnull error) {
		NSLog(@"Saved Succeed!");
	}];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	BHPerson *peron = [BHPerson current];
	NSLog(@"name: %@", peron.name);
	NSLog(@"language: %@", peron.language);
	/* 输出: name: qiaobahui
					language: english/changed
	 */
}

@end
