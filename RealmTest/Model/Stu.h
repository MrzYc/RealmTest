//
//  Stu.h
//  RealmTest
//
//  Created by Circcus on 2017/6/14.
//  Copyright © 2017年 com.circcus. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>


@interface Stu : RLMObject

@property int num;
@property NSString *name;
@property (readonly) UIImage *image; //忽略image
@property NSData *imageData;
//@property NSArray <NSString *>*arrays2;
// RLMArray 这个集合,有个要求,
// 里面存储的属性, 必须, 是继承自 RLMObject 类型的属性



@end


