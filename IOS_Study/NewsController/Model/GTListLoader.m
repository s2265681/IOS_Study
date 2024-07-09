
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
    
    [self _getSandBoxPath];
    
}

-(void)_getSandBoxPath{
    // document 文件夹路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    
    NSError *creatError;
    
    // 新建一个 GTData 的文件夹
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    // 新建一个 文件地址
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    // [fileManager createFileAtPath:listDataPath contents:nil attributes:nil];
    // 写入数据
    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    // 给文件写入数据
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    
    // 查询文件
    BOOL fileExit = [fileManager fileExistsAtPath:listDataPath];
    
    
    // 删除
//    if(fileExit){
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
    NSLog(@"");
    
    // 创建 handler 追加文件内容操作
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
    
    [fileHandler seekToEndOfFile];
    // 追加 def => abcdef
    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [fileHandler synchronizeFile];
    
    [fileHandler closeFile];
    
}

@end
