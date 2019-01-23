//
//  BHPerson+CoreDataProperties.m
//  BHCoreDataPropertyDemo
//
//  Created by QBH on 2019/1/23.
//  Copyright © 2019 YiBeiKeJi. All rights reserved.
//
//

#import "BHPerson+CoreDataProperties.h"

@implementation BHPerson (CoreDataProperties)

+ (NSFetchRequest<BHPerson *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"BHPerson"];
}

@dynamic name;
@dynamic language;

@end
