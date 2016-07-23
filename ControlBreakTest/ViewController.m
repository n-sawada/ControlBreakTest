//
//  ViewController.m
//  ControlBreakTest
//
//  Created by Naoki_Sawada on 2016/07/23.
//  Copyright © 2016年 nsawada. All rights reserved.
//

#import "ViewController.h"

@interface TestData : NSObject
@property (nonatomic) NSString *code;
@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger value;
@end

@implementation TestData
- (instancetype)initWithData:(NSString *)code name:(NSString *)name value:(NSInteger)value {
    if (self = [super init]) {
        _code = code;
        _name = name;
        _value = value;
    }
    return self;
}
@end


@interface ViewController ()

@property (nonatomic) NSMutableArray *testItems;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    TestData *test1 = [[TestData alloc] initWithData:@"A01" name:@"hoge" value:100];
    TestData *test2 = [[TestData alloc] initWithData:@"A01" name:@"piyo" value:200];
    TestData *test3 = [[TestData alloc] initWithData:@"A02" name:@"hoge" value:300];
    TestData *test4 = [[TestData alloc] initWithData:@"A03" name:@"hoge" value:400];
    TestData *test5 = [[TestData alloc] initWithData:@"A03" name:@"piyo" value:500];
    
    _testItems = [@[test1, test2, test3, test4, test5] mutableCopy];
    
    NSArray *receiver = [self controlBreak:self.testItems];
    
    NSLog(@"%@", receiver );
    
    
}

- (NSArray *)controlBreak:(NSArray<TestData *> *)testItems {
    
    NSMutableDictionary<NSString *, NSMutableArray<TestData *>*> *dic = [NSMutableDictionary new];
    
    for (TestData *item in self.testItems) {
        if (![dic.allKeys containsObject:item.code]) {
            NSMutableArray *inner = [NSMutableArray new];
            dic[item.code] = inner;
        }
        
        // item.xxx ?
        [(NSMutableArray *)dic[item.code] addObject:item];
    }
    
    return dic.allValues;
}

@end
