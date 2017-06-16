//
//  RelationB.h
//  RealmTest
//
//  Created by Circcus on 2017/6/16.
//  Copyright © 2017年 com.circcus. All rights reserved.
//

#import <Realm/Realm.h>
//#import "RelationA.h"


@interface RelationB : RLMObject

@property int num;
@property NSString *name;
@property (readonly) RLMLinkingObjects *master;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<RelationB *><RelationB>
RLM_ARRAY_TYPE(RelationB)
