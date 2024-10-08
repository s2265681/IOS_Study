//
//  GTListItem.m
//  IOS_Study
//
//  Created by mac on 2024/6/29.
//

#import "GTListItem.h"

@implementation GTListItem

-(void)configWithDictionary:(NSDictionary *)dictionary{
#warning 类型是否匹配
    self.category = [dictionary objectForKey: @"category"];
    self.picUrl  = [dictionary objectForKey: @"thumbnail_pic_s"];
    self.uniqueKey  = [dictionary objectForKey: @"uniquekey"];
    self.title  = [dictionary objectForKey: @"title"];
    self.date  = [dictionary objectForKey: @"date"];
    self.authorName  = [dictionary objectForKey: @"author_name"];
    self.articleUrl  = [dictionary objectForKey: @"url"];
};

@end
