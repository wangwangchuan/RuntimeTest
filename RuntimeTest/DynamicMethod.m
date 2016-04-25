//
//  DynamicMethod.m
//  RuntimeTest
//
//  Created by Daniel on 15/11/23.
//  Copyright (c) 2015年 Daniel. All rights reserved.
//

#import <objc/runtime.h>
#import "DynamicMethod.h"
#import "ForwardInvocation.h"
@implementation DynamicMethod
{
    ForwardInvocation *invocation;
}

-(instancetype)init {
    if (self=[super init]) {
         invocation = [[ForwardInvocation alloc]init];
    }
    return self;
}

void dynamicMethodIMP(id self,SEL _cmd) {
    //implementation
    NSLog(@"HELLO WORLD--%@--%s",self,_cmd);
}

+ (BOOL) resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(resolveThisMethodDynamically)) {
        class_addMethod([self class],sel,(IMP)dynamicMethodIMP,"v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
//- (void)negotiate
//{
//    if ([invocation respondsToSelector:@selector(negotiate)] )
//    {
//        [invocation negotiate];
//    }
//}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *sign;
    sign = [invocation methodSignatureForSelector:aSelector];
    return sign;
}
-(void)forwardInvocation:(NSInvocation *)anInvocation
{
    
    if([invocation respondsToSelector:[anInvocation selector]]){
        [anInvocation invokeWithTarget:invocation];
    }
    else {
        [super forwardInvocation:anInvocation];
    }
}

-(void)propertyList
{
    id dynamicClass = objc_getClass("DynamicMethod");
    unsigned int outCount,i;
    objc_property_t *properties = class_copyPropertyList(dynamicClass, &outCount);
    for(i = 0;i<outCount;i++) {
        objc_property_t property = properties[i];
        fprintf(stdout, "%s--%s\n",property_getName(property),property_getAttributes(property));
    }
}

@end
