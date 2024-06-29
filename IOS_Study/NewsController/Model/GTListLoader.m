
#import "GTListLoader.h"
//#import <AFNetworking.h>
#import<AFNetworking.h>

@implementation GTListLoader

-(void)loadListData{
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
        
        
        NSLog(@"");
    }];
    
    [dataTask resume];
    
    NSLog(@"");
}

@end
