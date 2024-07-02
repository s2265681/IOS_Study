//
//  GTDetailViewController.h
//  IOS_Study
//
//  Created by mac on 2024/6/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDetailViewController : UIViewController

/**
 初始化函数 暴露 文章底层页
 */
-(instancetype)initWithUrlString:(NSString *)urlString;
    
@end

NS_ASSUME_NONNULL_END
