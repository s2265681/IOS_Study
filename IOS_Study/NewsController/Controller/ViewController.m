//
//  ViewController.m
//  IOS_Study
//
//  Created by mac on 2024/6/25.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTListLoader.h"
#import "GTListItem.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong,readwrite) GTListLoader *listLoader;
@property(nonatomic,strong,readwrite) NSArray *dataArray;

@end

@implementation ViewController

-(instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewIsAppearing:(BOOL)animated{
    [super viewIsAppearing:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView= [[UITableView alloc] initWithFrame:self.view.bounds];
    
    // UITableViewDataSource 提供数据
    tableView.dataSource = self;
    
    //UITableViewDelegate 提供 事件 消失的时机 header、footer 设置
    tableView.delegate = self;
    
    
    [self.view addSubview:tableView];
    
    // 调用loader网络请求
    // 生成listLoader
    self.listLoader = [[GTListLoader alloc] init];
    // 调用 loadListData 方法
    
//    [self.listLoader loadListData];
    
    // 改造 loadListData 调用的方法 处理 self 循环引用
    __weak typeof(self)wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(wself) strongSelf = wself;
        
        strongSelf.dataArray = dataArray;
//        [strongSelf.tableView reloadData];
        
        NSLog(@"");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
//  由系统提供的服用逻辑，先到系统回收池中去取
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    // 每次的 TableView 需要布局的时候调用这个方法
//    [cell layoutTableViewCell];
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    
    
    
//    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@",@(indexPath.row)];  //@"主标题";
//    cell.detailTextLabel.text = @"副标题";
//    cell.imageView.image = [UIImage imageNamed:@"home"];
    return cell;
}


// UITableView delegate
// 设置高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

// 点击哪个cell，获取index 实现一个点击进入对应页面的逻辑， 新建一个 uiviewcontroller
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 进入新建的ViewController
    // UIViewController *controller = [[UIViewController alloc] init];
    // 进入GTDetailViewController
    
    // 通过 index 索引 获取dataArray 中的 每个信息
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString: item.articleUrl];
//    GTDetailViewController *controller = [[GTDetailViewController alloc] init];
    
    controller.view.backgroundColor = [UIColor systemPinkColor];
    controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}

// 执行的方法
-(void)pushController{
    // 新建一个viewControll 视图
    UIViewController *viewController =  [[UIViewController alloc] init];
    // 添加背景色
    viewController.view.backgroundColor = [UIColor whiteColor];
    // 设置当前view的title文字
    viewController.navigationItem.title = @"内容";
    // 设置右侧文字内容
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    // 添加到navigation跳转view逻辑上
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
