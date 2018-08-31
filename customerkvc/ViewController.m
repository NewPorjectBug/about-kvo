//
//  ViewController.m
//  customerkvc
//
//  Created by ycq on 2018/8/24.
//  Copyright © 2018年 ycq. All rights reserved.
//

#import "ViewController.h"

#import "people.h"

#import "NSObject+KVO.h"



@interface ViewController ()

{
    
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    people *pe=[[people alloc]init];
    
    self.pe=[[people alloc]init];
    
    self.pe.name=[[NSString alloc]init];
    
    [self.pe setValue:@"黄龙" forKeyPath:@"name"];
    
//    NSLog(@"%@",[pe valueForKeyPath:@"name"]);
    
    [self.pe PE_addobserve:self forkeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame=CGRectMake(100,100, 200, 100);
    
    btn.backgroundColor=[UIColor brownColor];
    
    btn.titleLabel.text=@"点我就改变";
    
    
//    btn.titleLabel.text=@"点我就改变";
    
    
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
//    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnclick
{
    
    NSLog(@"!!!!!!");
    
    self.pe.name=@"小黄狗";
//    [self.pe setValue:@"小黄狗" forKeyPath:@"name"];
}

//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{
//
//    if ([keyPath isEqualToString:@""])
//    {
//
//
//    }
//
//}

-(void)PE_addobserve:(NSObject *)observer forkeyPath:(NSString *)keypath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    NSLog(@"我可能要换个名字了:%@",[self.pe valueForKeyPath:@"name"]);

    
    
}

//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{
//
//    NSLog(@"我可能要换个名字了:%@",[self.pe valueForKeyPath:@"name"]);
//
//
//}

-(void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context

{
    
    
    NSLog(@"我可能要换个名字了:%@",[self.pe valueForKeyPath:@"name"]);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
