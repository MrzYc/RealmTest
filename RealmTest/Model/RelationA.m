//
//  RelationA.m
//  RealmTest
//
//  Created by Circcus on 2017/6/16.
//  Copyright © 2017年 com.circcus. All rights reserved.
//

#import "RelationA.h"

@implementation RelationA

// Specify default values for properties

+(NSString *)primaryKey {
    return @"num";
}


// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
