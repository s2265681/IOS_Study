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


@interface ViewController ()

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
    
    // Do any additional setup after loading the view.
    // 设置一个 hello world
//    [self.view addSubview:({
//        UILabel *label = [[UILabel alloc] init];
//        label.text = @"hello world";
//        [label sizeToFit];
//        label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
//        label;
//    })];
//    
//    UIView *view2  = [[UIView alloc] init];
//    view2.backgroundColor = [UIColor redColor];
//    view2.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:view2];
//    
//    UIView *view  = [[UIView alloc] init];
//    view.backgroundColor = [UIColor greenColor];
//    view.frame = CGRectMake(110, 150, 100, 100);
//    [self.view addSubview:view];
//    
    
    
        TestView *view  = [[TestView alloc] init];
        view.backgroundColor = [UIColor greenColor];
        view.frame = CGRectMake(110, 150, 100, 100);
        [self.view addSubview:view];
    
}


@end
