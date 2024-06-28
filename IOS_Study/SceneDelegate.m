
#import "SceneDelegate.h"
#import "ViewController.h"
#import "GTVideoViewController.h"

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
    viewController.view.backgroundColor = [UIColor redColor];
    viewController.tabBarItem.title = @"新闻";
    viewController.tabBarItem.image = [UIImage imageNamed:@"home"];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:@"home-active"];

    
    GTVideoViewController *videoController = [[GTVideoViewController alloc] init];

    
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
    [tabbarController setViewControllers:@[controller1,videoController,controller3,controller4]];
    
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
