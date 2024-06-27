//
//  ViewController.m
//  IOS_Study
//
//  Created by mac on 2024/6/25.
//

#import "ViewController.h"


@interface TestView : UIView
@end

@implementation TestView

-(instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToSuperview:newWindow];
}

- (void)didMoveToWindow{
    [super didMoveToWindow];
}
@end


@interface ViewController ()<UITableViewDataSource>

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
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    cell.textLabel.text = @"主标题";
    cell.detailTextLabel.text = @"副标题";
    cell.imageView.image = [UIImage imageNamed:@"home"];
    return cell;
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
