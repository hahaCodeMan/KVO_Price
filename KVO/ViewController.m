//
//  ViewController.m
//  KVO
//
//  Created by Risen on 2017/10/9.
//  Copyright © 2017年 Risen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property(nonatomic,strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p =[[Person alloc]init];
    self.p.name =@"wtl";
    
    [self.p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld context:@"test"];
    
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bbb)];
    [self.view addGestureRecognizer:tap];
}

-(void)bbb {


self.p.name = @"ccd";


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 //KVO的使用
//一般分为三步
//1.注册监听

///**
// 添加KVO监听者
//
// @param observer 观察者(监听器)
// @param keyPath 属性名(要观察的属性)
// @param options
// @param context 传递的参数
// */
//-(void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
//    
//
//}
//2.0设置监听事件
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@ %@ %@ %@",object,keyPath,change,context);
}
//3.0取消监听
//释放kvo监听
-(void)dealloc{
[ self.p removeObserver:self forKeyPath:@"test"];
}


@end
