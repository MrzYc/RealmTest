//
//  Stu.h
//  RealmTest
//
//  Created by Circcus on 2017/6/14.
//  Copyright © 2017年 com.circcus. All rights reserved.
//

#import <Realm/Realm.h>

@interface Stu : RLMObject

@property int num;
@property NSString *name;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Stu *><Stu>
RLM_ARRAY_TYPE(Stu)
