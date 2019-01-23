//
//  BHPerson+DataManager.m
//  BHCoreDataPropertyDemo
//
//  Created by QBH on 2019/1/23.
//  Copyright © 2019 YiBeiKeJi. All rights reserved.
//

#import "BHPerson+DataManager.h"
#import "BHPerson+Update.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation BHPerson (DataManager)

+ (instancetype)current {
	return [BHPerson MR_findFirst];
}

+ (void)createOrUpdateByDictionaryData:(NSDictionary *)data completion:(void(^)(BOOL success, NSError *error))completion {
	[MagicalRecord saveWithBlock:^(NSManagedObjectContext *context) {
		
		BHPerson *person = [self currentInContext:context];
		[person updateFromDictionary:data];
		
	} completion:completion];
}

#pragma mark - Private Methods

+ (instancetype)currentInContext:(NSManagedObjectContext *)context {
	return [BHPerson MR_findFirstInContext:context] ?: [BHPerson MR_createEntityInContext:context];
}

@end
