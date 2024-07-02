//
//  GTListLoader.h
//  IOS_Study
//
//  Created by mac on 2024/6/29.
//

#import <Foundation/Foundation.h>


// 声明一下GTListItem 使用的时候在引用
@class GTListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderfinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);


/**
 列表请求
 */
@interface GTListLoader : NSObject


// 改造。 加载接口通过 block 去解析返回的结果
//-(void)loadListData;
-(void)loadListDataWithFinishBlock:(GTListLoaderfinishBlock)finishBlock;
    
@end

NS_ASSUME_NONNULL_END
