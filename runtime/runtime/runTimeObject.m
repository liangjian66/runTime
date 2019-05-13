//
//  runTimeObject.m
//  runtime
//
//  Created by hywin on 2019/5/13.
//  Copyright © 2019年 SF. All rights reserved.
//

#import "runTimeObject.h"

@implementation runTimeObject

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel = @selector(test)) {
        NSLog(@"resolveInstanceMethod");
        return NO;
    }
    else{
        return [super resolveInstanceMethod:sel];
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    NSLog(@"forwardingTargetForSelector");
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if (aSelector==@selector(test)) {
        NSLog(@"methodSignatureForSelector");
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
        
    }else{
        return [super methodSignatureForSelector:aSelector];
    }
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"forwardInvocation");
}
@end
