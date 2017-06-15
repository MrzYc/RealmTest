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
//    
//    RLMRealm *realm = [RLMRealm defaultRealm];
    
//    [realm beginWriteTransaction];
//    
//    [realm addObject:stu];
//    
//    [realm commitWriteTransaction];
    
//    [realm transactionWithBlock:^{
//        [realm addObject:stu];
////        [Stu createInRealm:realm withValue:@{@"num":@22, @"name":@"王三"}];
//    }];
    
    //更新某个字段
//    [self stuUpdate];
    
    //删除某个 model
//    [self realmDeleModel];
    
    //查询数据库
    [self realmSearch];
    
    
}


//更新某个字段
- (void)stuUpdate {
    
    
    //方式1
    
    // 这个模型stu, 已经被realm 所管理, 而且, 已经和磁盘上的对象, 进行的地址映射
    //    [realm transactionWithBlock:^{
    //        [realm addObject:stu];
    //    }];
    //
    //    // 这里修改的模型, 一定是被realm所管理的模型
    //    [realm transactionWithBlock:^{
    //       stu.name = @"王二小在山边吃草";
    //    }];
    
    
    // 方式2
    //    RLMResults *results = [Stu objectsWhere:@"name = '王二小'"];
    //    Stu *stu = results.firstObject;
    //    [realm transactionWithBlock:^{
    //       stu.name = @"王二";
    //    }];
    
    // 方式3
//    Stu *stu = [[Stu alloc] initWithValue:@[@3, @"方式3的更新"]];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
//        [realm addOrUpdateObject:stu];
        [Stu createOrUpdateInRealm:realm withValue:@[@3, @"另一种更新"]];
    }];
    
}


//删除某个字段
- (void)realmDeleModel {
    
    RLMRealm *realm = [RLMRealm defaultRealm];

//    RLMResults *results = [Stu objectsWhere:@"name = '方式3'"];
//    Stu *stu = results.firstObject;

    //删除的模型,一定要是realm管理的
    [realm transactionWithBlock:^{
        //删除指定存储对象
//        [realm deleteObject:stu];
        
        //删除所有对象
        [realm deleteAllObjects];
    }];
    
    // 场景,是删除某一特定类型的所有模型
    RLMResults *stuRes = [Stu allObjects];
    for (Stu *stu in stuRes) {
        [realm transactionWithBlock:^{
            [realm deleteObject:stu];
        }];
    }
    
    // 场景, 根据主键删除一个模型
    // 1. 根据主键, 查询到这个模型(这个模型, 就是被realm数据库管理的模型)
    Stu *stuDel = [Stu objectInRealm:realm forPrimaryKey:@2];
    // 2. 删除该模型
    [realm transactionWithBlock:^{
        [realm deleteObject:stuDel];
    }];
}

//realm 查询
- (void)realmSearch {
    
    // 1. 所有的查询（包括查询和属性访问）在 Realm 中都是延迟加载的，只有当属性被访问时，才能够读取相应的数据
    RLMResults *stuRes = [Stu allObjects];
    NSLog(@"%@", stuRes);
    
    Stu *stu = [[Stu alloc] initWithValue:@[@3,@"土豆"]];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:stu];
    }];
    
    NSLog(@"%@", stuRes);
    
}

@end
