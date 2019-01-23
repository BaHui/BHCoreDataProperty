//
//  BHPerson+Accessors.m
//  BHCoreDataPropertyDemo
//
//  Created by QBH on 2019/1/23.
//  Copyright © 2019 YiBeiKeJi. All rights reserved.
//

#import "BHPerson+Accessors.h"

@interface BHPerson ()

// Original `name` Setter && Getter Method
- (NSString *)managedObjectOriginal_name;
- (void)managedObjectOriginal_setName:(NSString *)name;

// Original `language` Setter && Getter Method
- (NSString *)managedObjectOriginal_language;
- (void)managedObjectOriginal_setLanguage:(NSString *)language;

@end


@implementation BHPerson (Accessors)

#pragma mark - Override `name` Setter && Getter Method

- (void)setName:(NSString *)name {
	NSString *willSaveName = [NSString stringWithFormat:@"%@%@", name, @"/changed"];
	[self managedObjectOriginal_setName:willSaveName];
}

- (NSString *)name {
	NSString *savedName = [self managedObjectOriginal_name];
	return [savedName stringByReplacingOccurrencesOfString:@"/changed" withString:@""];
}

#pragma mark - Override `language` Setter && Getter Method

- (void)setLanguage:(NSString *)language {
	NSString *willSaveLanguage = [NSString stringWithFormat:@"%@%@", language, @"/changed"];
	[self managedObjectOriginal_setLanguage:willSaveLanguage];
}

- (NSString *)language {
	NSString *savedLanguage = [self managedObjectOriginal_language];
	return savedLanguage;
}

@end
