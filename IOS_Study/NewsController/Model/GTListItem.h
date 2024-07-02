//
//  GTListItem.h
//  IOS_Study
//
//  Created by mac on 2024/6/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 列表结构化数组
 */
@interface GTListItem : NSObject

@property(nonatomic,copy,readwrite) NSString *category;
@property(nonatomic,copy,readwrite) NSString *picUrl;
@property(nonatomic,copy,readwrite) NSString *uniqueKey;
@property(nonatomic,copy,readwrite) NSString *title;
@property(nonatomic,copy,readwrite) NSString *date;
@property(nonatomic,copy,readwrite) NSString *authorName;
@property(nonatomic,copy,readwrite) NSString *articleUrl;

// 这个函数解析赋值上面的所有属性
-(void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
