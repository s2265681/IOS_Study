//
//  GTDetailViewController.m
//  IOS_Study
//
//  Created by mac on 2024/6/29.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite) WKWebView *webView;
@property(nonatomic,strong,readwrite) UIProgressView *progressView;
// 文章url
@property(nonatomic,copy,readwrite) NSString *articleUrl;

@end

@implementation GTDetailViewController

// 销毁的时候移除监听
-(void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
};


/**
 传入url 展示详情页
 */
-(instancetype)initWithUrlString:(NSString *)urlString{
    self= [super init];
    if(self){
        self.articleUrl = urlString;
    }
    return self;
};


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        
        self.webView.navigationDelegate = self;
        
        self.webView;
    })];
    
    // 添加一个进度条 UI
    [self.webView addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    
    // 添加 KVO 监听
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
}


// 实现监听的回调
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    NSLog(@"监听变化");
    
    // 设置进度条的进度
    self.progressView.progress = self.webView.estimatedProgress;
};

// 监听webview加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"加载完毕哦");

    //将其从父视图中移除
    [self.progressView removeFromSuperview];
}


// 是否允许展示webview内容
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
};


@end
