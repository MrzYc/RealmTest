//
//  ViewController.m
//  RealmTest
//
//  Created by Circcus on 2017/6/14.
//  Copyright © 2017年 com.circcus. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "Stu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Stu *stu = [[Stu alloc] initWithValue:@[@2,@"土豆"]];
    
//    RLMRealm *realm = [RLMRealm defaultRealm];
    
//    [realm beginWriteTransaction];
    
//    [realm addObject:stu];
    
//    [realm commitWriteTransaction];
    
//    [realm transactionWithBlock:^{
//        [Stu createInRealm:realm withValue:@{@"num":@22, @"name":@"王三"}];
//    }];
    
    [self stuUpdate];
    
}


//
- (void)stuUpdate {
//    Stu *stu = [[Stu alloc] initWithValue:@[@3, @"方式3的更新"]];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
//        [realm addOrUpdateObject:stu];
        [Stu createOrUpdateInRealm:realm withValue:@[@3, @"另一种更新"]];
    }];
    
    
    
}

@end
