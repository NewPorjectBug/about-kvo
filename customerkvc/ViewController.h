//
//  ViewController.h
//  customerkvc
//
//  Created by ycq on 2018/8/24.
//  Copyright © 2018年 ycq. All rights reserved.
//

#import <UIKit/UIKit.h>



@class people;
@interface ViewController : UIViewController
@property(nonatomic,strong)people *pe;

-(void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
@end

