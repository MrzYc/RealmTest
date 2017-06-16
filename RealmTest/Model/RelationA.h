//
//  RelationA.h
//  RealmTest
//
//  Created by Circcus on 2017/6/16.
//  Copyright © 2017年 com.circcus. All rights reserved.
//

#import <Realm/Realm.h>
#import "RelationB.h"
@interface RelationA : RLMObject
@property int num;
@property NSString *name;
//@property RelationB *petB;
@property RLMArray<RelationB *><RelationB> *pets;


@end

// This protocol enables typed collections. i.e.:
// RLMArray<RelationA *><RelationA>
RLM_ARRAY_TYPE(RelationA)
