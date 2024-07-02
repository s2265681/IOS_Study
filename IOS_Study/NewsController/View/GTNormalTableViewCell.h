//
//  GTNormalTableViewCell.h
//  IOS_Study
//
//  Created by mac on 2024/6/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;


/**
 点击删除按钮
 */

@protocol GYNormalTableViewCellDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

/**
 新闻列表cell
 */
@interface GTNormalTableViewCell : UITableViewCell


// 暴露这个方法
//-(void) layoutTableViewCell;
- (void) layoutTableViewCellWithItem: (GTListItem *)item;


@end

NS_ASSUME_NONNULL_END
