//
//  RelationB.m
//  RealmTest
//
//  Created by Circcus on 2017/6/16.
//  Copyright © 2017年 com.circcus. All rights reserved.
//

#import "RelationB.h"

@implementation RelationB

// Specify default values for properties

//反向关系
+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties {
    return @{
             @"master": [RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"RelationA") propertyName:@"pets"]
             };
}



// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
