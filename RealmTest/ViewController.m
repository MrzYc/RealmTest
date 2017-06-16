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
#import "RelationA.h"
#import "RelationB.h"
#import "EmptyValue.h"

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
//    [self realmSearch];
    
//    [self supportdataType];
    
//    [self realmRelaion];
    
    [self emptyRealm];
    
    
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
    
    /*
    // 1. 所有的查询（包括查询和属性访问）在 Realm 中都是延迟加载的，只有当属性被访问时，才能够读取相应的数据
    RLMResults *stuRes = [Stu allObjects];
    NSLog(@"%@", stuRes);
    
    Stu *stu = [[Stu alloc] initWithValue:@[@4,@"土豆"]];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:stu];
    }];
    
    NSLog(@"%@", stuRes);
     
     **/
    

    
    RLMResults<Stu *> *stus = [Stu objectsWhere:@"num > 1"];
    NSLog(@"%@", stus);
    
    RLMResults *sortRes = [stus sortedResultsUsingKeyPath:@"name" ascending:NO];
    NSLog(@"%@", sortRes);
    
    //链式查询 -- 连续使用查询语句
    RLMResults *subRes = [stus objectsWhere:@"num > 2"];
    [subRes objectsWhere:@"num > 3"];
    
    //    sql
    // 第一个参数: 跳过几条
    // 第二个参数, 取多少条
    //    select * from stu limit 3,3;
    //
    RLMResults *allObj = [Stu allObjects];
    for (int i= 3; i < allObj.count; i ++) {
        Stu *stu = allObj[i];
        NSLog(@"%@", stu);
    }
}


//支持的数据类型
- (void)supportdataType {
    
    Stu *stu = [[Stu alloc] init];
    stu.name = @"王小二";
    stu.num = 2;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"logo.png" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    stu.imageData = data;
    //    stu.image = [UIImage imageNamed:@"a.png"];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        //        [realm addObject:stu];
        [realm addOrUpdateObject:stu];
    }];
}


//存储关系
- (void)realmRelaion {
//    RelationA *A = [[RelationA alloc] init];
//    A.num = 1;
//    A.name = @"A";
//   
//    
//    RelationB *pet1 = [RelationB new];
//    pet1.name = @"B1";
//    pet1.num = 1;
//
//    
//    RelationB *pet2 = [RelationB new];
//    pet2.name = @"B2";
//    pet2.num = 2;
//
//    [A.pets addObject:pet1];
//    [A.pets addObject:pet2];
//    
//    
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm transactionWithBlock:^{
//        [realm addObject:A];
//    }];
    
    
    RelationA *result = [RelationA allObjects].firstObject;
    NSLog(@"%@",result.pets.firstObject.master);

}

//给reaml 赋空值
- (void)emptyRealm {
    
    EmptyValue *empty = [[EmptyValue alloc] init];
    empty.a = 1;
        
    //1.获取realm对象
    RLMRealm *realm = [RLMRealm defaultRealm];
    //2.开启写入事物
    [realm beginWriteTransaction];
    //3.执行修改动作
    [realm addObject:empty];
    //4.提交写入事物
    [realm commitWriteTransaction];
    
    [realm transactionWithBlock:^{
        [realm addObject:empty];
    }];
    
    
}


@end
