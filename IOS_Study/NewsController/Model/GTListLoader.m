
#import "GTListLoader.h"
//#import <AFNetworking.h>
#import<AFNetworking.h>

#import "GTListItem.h"

@implementation GTListLoader




//-(void)loadListData{
// 改造请求
-(void)loadListDataWithFinishBlock:(GTListLoaderfinishBlock)finishBlock{
    // 使用开源框架
//    [[AFHTTPSessionManager manager] GET:@"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"");
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];
//   
//
//    1、封装request 包含网址和参数
    NSURL *listURL = [NSURL URLWithString:@"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e"];
    
//   __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
//    2、dataTask 属于session 这里是默认session
    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listRequest];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error: &jsonError];
        
        // 从jsonObj 中取 result 在取 data
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        
        // 赋值
        NSMutableArray *listItemArray = @[].mutableCopy;
        for(NSDictionary *info in dataArray){
            GTListItem *listItem = [[GTListItem alloc] init];
            // 调用 listItem 上的方法进行赋值
            [listItem configWithDictionary:info];
            // 添加到数组上
            [listItemArray addObject:listItem];
        }
        
        // 希望所有回调都在主线程，增加一个dispatch
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock(error == nil, listItemArray.copy);
            }
        });
      
    }];
    [dataTask resume];
    
}

@end
