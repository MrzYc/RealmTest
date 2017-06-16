//
//  EmptyValue.h
//  RealmTest
//
//  Created by Circcus on 2017/6/16.
//  Copyright © 2017年 com.circcus. All rights reserved.
//

#import <Realm/Realm.h>

@interface EmptyValue : RLMObject

@property int a;
@property int b;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<EmptyValue *><EmptyValue>
RLM_ARRAY_TYPE(EmptyValue)
