//
//  UIImage+Image.m
//  runtime
//
//  Created by hywin on 2019/5/10.
//  Copyright © 2019年 SF. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>
@implementation UIImage (Image)



// 加载分类到内存的时候调用
+ (void)load
{
    // 交换方法
    
    // 获取imageWithName方法地址
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    
    // 获取imageWithName方法地址
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    
    // 交换方法地址，相当于交换实现方式
    method_exchangeImplementations(imageWithName, imageName);
    
    
}

// 不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super.

// 既能加载图片又能打印
+ (instancetype)imageWithName:(NSString *)name
{
    
    // 这里调用imageWithName，相当于调用imageName
    UIImage *image = [self imageWithName:name];
    
    if (image == nil) {
        NSLog(@"加载空的图片");
    }
    
    return image;
}


@end
