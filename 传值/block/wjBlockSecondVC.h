//
//  wjBlockSecondVC.h
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^wjPassValueBlock)(NSString *name, NSString *secreat);

@interface wjBlockSecondVC : UIViewController

/** block*/
@property (nonatomic, strong) wjPassValueBlock passValueBlock;

@end
