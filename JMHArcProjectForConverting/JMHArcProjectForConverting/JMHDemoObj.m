//
//  JMHDemoObj.m
//  JMHArcProjectForConverting
//
//  Created by god on 12/9/14.
//  Copyright (c) 2014 juanmao. All rights reserved.
//

#import "JMHDemoObj.h"

@implementation JMHDemoObj

- (void)doSomething
{
    
   CFMutableStringRef ref =  CFStringCreateMutable(kCFAllocatorDefault, 10);
    NSString *string = (__bridge NSString *)ref;
    CFRelease(ref);
    
    /*
     等同于
     CFMutableStringRef ref =  CFStringCreateMutable(kCFAllocatorDefault, 10);
     NSString *string = (__bridge_transfer NSString *)ref;
     */
    
    
    
//    
//    void *p;
//    {
//        NSObject *obj = [[NSObject alloc] init];
//        p = (__bridge void *)obj;
//    }
//    
//    __weak id weakObj = (__bridge id)p;
//   // NSLog(@"%@",  [weakObj class]);
//    
//    {
//        NSObject *obj = [[NSObject alloc] init];
//        p = (__bridge_retained void *)obj;
//    }
//    
//    weakObj = (__bridge id)p;
//    NSLog(@"%@", [weakObj class]);
//    
//    
//    weakObj = (__bridge_transfer id)p;
//    NSLog(@"%@", [weakObj class]);
    
    
}

- (NSString *)someString
{
    return [NSString stringWithUTF8String:"juanmao"];
}

@end
