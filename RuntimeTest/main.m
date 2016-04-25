//
//  main.m
//  RuntimeTest
//
//  Created by Daniel on 15/11/23.
//  Copyright (c) 2015年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicMethod.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
//        DynamicMethod *a = [[DynamicMethod alloc]init];
//        SEL aSelecor = @selector(negotiate);
//        [a performSelector:aSelecor];
        id obj1 = [NSMutableString alloc];
        id obj2 = [[NSMutableString alloc] init];
        
        id obj3 = [NSArray alloc];
        id obj4 = [[NSArray alloc] initWithObjects:@"Hello",nil];
        
        NSLog(@"obj1 class is %@",NSStringFromClass([obj1 class]));
        NSLog(@"obj2 class is %@",NSStringFromClass([obj2 class]));
        
        NSLog(@"obj3 class is %@",NSStringFromClass([obj3 class]));
        NSLog(@"obj4 class is %@",NSStringFromClass([obj4 class]));
        
        id obj5 = [DynamicMethod alloc];
        id obj6 = [[DynamicMethod alloc] init];
        
        NSLog(@"obj5 class is %@",NSStringFromClass([obj5 class]));
        NSLog(@"obj6 class is %@",NSStringFromClass([obj6 class]));
    }
    return 0;
}
