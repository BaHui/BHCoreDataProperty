//
//  BHPerson+DataManager.h
//  BHCoreDataPropertyDemo
//
//  Created by QBH on 2019/1/23.
//  Copyright © 2019 YiBeiKeJi. All rights reserved.
//

#import "BHPerson+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHPerson (DataManager)

+ (void)createOrUpdateByDictionaryData:(NSDictionary *)data completion:(void(^)(BOOL success, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
