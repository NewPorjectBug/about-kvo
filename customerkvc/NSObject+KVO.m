//
//  NSObject+KVO.m
//  customerkvc
//
//  Created by ycq on 2018/8/30.
//  Copyright © 2018年 ycq. All rights reserved.
//

#import "NSObject+KVO.h"

#import <objc/runtime.h>

#import <objc/message.h>


@implementation NSObject (KVO)


-(void)PE_addobserve:(NSObject *)observer forkeyPath:(NSString *)keypath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    //  1.动态生成新的对象
    
    objc_setAssociatedObject(self, (__bridge const void*)@"objc", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    NSString *oldstring=NSStringFromClass([self class]);
    
    NSString *newString=[@"PE_" stringByAppendingString:oldstring];
    
    const char* newname=[newString UTF8String];
    
    Class newclass=objc_allocateClassPair([self class], newname, 0);
    
    class_addMethod(newclass, @selector(setName:),(IMP)setName,"v@:@");
    
    objc_registerClassPair(newclass);
    
    object_setClass(self, newclass);
    
    
}

void setName(id self,SEL _cmd,NSString* name)
{
    
    Class myclass=[self class];
    
    object_setClass(self,class_getSuperclass([self class]));
    
//    struct objc_super sup;
//
//    sup.receiver=myclass;
//
//    sup.super_class=class_getSuperclass([self class]);
    
    objc_msgSend(self,@selector(setName:),name);
    
    id objc= objc_getAssociatedObject(self, (__bridge const void*)@"objc");
    
    objc_msgSend(objc, @selector(addObserver:forKeyPath:options:context:),self,name,NSKeyValueObservingOptionNew,nil);
    
    object_setClass(self, myclass);
    
}




@end
