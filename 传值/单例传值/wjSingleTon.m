//
//  wjSingleTon.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "wjSingleTon.h"

@implementation wjSingleTon

+ (wjSingleTon *)shareSingleTon {
    static wjSingleTon *singleTon = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        singleTon = [[self alloc] init];
    });
    return singleTon;
}

@end
