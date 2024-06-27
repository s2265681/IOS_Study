
#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    

    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    // 创建 UINavigationController 跟视图设置为 ViewController
    ViewController *viewController = [[ViewController alloc] init];
    
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: viewController];
//    navigationController.view.backgroundColor = [UIColor redColor];
//    navigationController.tabBarItem.title = @"新闻";
//    navigationController.tabBarItem.image = [UIImage imageNamed:@"home"];
//    navigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"home-active"];
//    
    UIViewController *controller1 = viewController; // [[UIViewController alloc] init];
    controller1.view.backgroundColor = [UIColor redColor];
    controller1.tabBarItem.title = @"新闻";
    controller1.tabBarItem.image = [UIImage imageNamed:@"home"];
    controller1.tabBarItem.selectedImage = [UIImage imageNamed:@"home-active"];

    
    UIViewController *controller2 = [[UIViewController alloc] init];
    controller2.view.backgroundColor = [UIColor yellowColor];
    controller2.tabBarItem.title = @"视频";
    controller2.tabBarItem.image = [UIImage imageNamed:@"expore"];
    controller2.tabBarItem.selectedImage = [UIImage imageNamed:@"expore-active"];
    
    UIViewController *controller3 = [[UIViewController alloc] init];
    controller3.view.backgroundColor = [UIColor greenColor];
    controller3.tabBarItem.title = @"推荐";
    controller3.tabBarItem.image = [UIImage imageNamed:@"setting"];
    controller3.tabBarItem.selectedImage = [UIImage imageNamed:@"setting-active"];
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor lightGrayColor];
    controller4.tabBarItem.title = @"我的";
    controller4.tabBarItem.image = [UIImage imageNamed:@"setting"];
    controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"setting-active"];
    
    // 给TabBar设置一个背景色
    tabbarController.tabBar.backgroundColor = [UIColor orangeColor];
    // 用 navigationController 替换 controller1
    [tabbarController setViewControllers:@[controller1,controller2,controller3,controller4]];
    
    // 调用delegate 的方法
    tabbarController.delegate = self;
    
    // 生成navgationcontroller
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: tabbarController];
    
    
    
    //  单页面应用
    // self.window.rootViewController    = [[ViewController alloc] init];
    // TabBar 多页面应用
    // self.window.rootViewController = tabbarController;
    // 改造后的tabbar 跳转到新的页面
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
}


@end
