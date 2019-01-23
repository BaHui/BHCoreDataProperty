//
//  BHPerson+Update.m
//  BHCoreDataPropertyDemo
//
//  Created by QBH on 2019/1/23.
//  Copyright © 2019 YiBeiKeJi. All rights reserved.
//

#import "BHPerson+Update.h"

@implementation BHPerson (Update)

- (void)updateFromDictionary:(NSDictionary *)data {
	NSString *name = [data objectForKey:@"name"];
	self.name = name;
	
	NSString *language = [data objectForKey:@"language"];
	self.language = language;
}

@end
