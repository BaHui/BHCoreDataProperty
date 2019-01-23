//
//  BHPerson+CoreDataProperties.h
//  BHCoreDataPropertyDemo
//
//  Created by QBH on 2019/1/23.
//  Copyright © 2019 YiBeiKeJi. All rights reserved.
//
//

#import "BHPerson+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHPerson (CoreDataProperties)

+ (NSFetchRequest<BHPerson *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *language;

@end

NS_ASSUME_NONNULL_END
