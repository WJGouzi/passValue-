//
//  wjSingleTon.h
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjSingleTon : NSObject

// 这个单例就相当于是传值的媒介

/** name*/
@property (nonatomic, copy) NSString *name;
/** seceat*/
@property (nonatomic, copy) NSString *secreat;

+ (wjSingleTon *)shareSingleTon;
@end
