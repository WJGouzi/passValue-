//
//  wjDelegateSecondVC.h
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol wjDelegateSecondVCDelegate <NSObject>

- (void)secdonVCReturnUsername:(NSString *)username secreat:(NSString *)secreat;

@end


@interface wjDelegateSecondVC : UIViewController

/** delegate */
@property (nonatomic, weak) id<wjDelegateSecondVCDelegate> delegate;

@end
