//
//  NSObject+KVO.h
//  customerkvc
//
//  Created by ycq on 2018/8/30.
//  Copyright © 2018年 ycq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

-(void)PE_addobserve:(NSObject *)observer forkeyPath:(NSString *)keypath options:(NSKeyValueObservingOptions)options context:(void *)context;


@end
