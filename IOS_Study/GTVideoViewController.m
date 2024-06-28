//
//  GTVideoViewController.m
//  IOS_Study
//
//  Created by mac on 2024/6/28.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation GTVideoViewController

- (instancetype) init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"expore"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"expore-active"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    

    
    // 创建一个layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10; // 设置行间距
    flowLayout.minimumInteritemSpacing = 10; // 设置每个item之间间距
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width-10)/2,300); // 设置每个item的宽度
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout: flowLayout];
    
    // 注册一个cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    
    // 添加datasource 和 delegate
    collectionView.delegate = self;
    collectionView.dataSource=self;
    
    [self.view addSubview:collectionView];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 200;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 从系统回收池内获取 cell 去不到会从上面的注册 cell 的地方创建
    UICollectionView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath: indexPath];
        cell.backgroundColor  = [UIColor redColor];
        return cell;
}

// 通过 delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.item %3 ==0){
        return CGSizeMake(self.view.frame.size.width,200);
    }else{
        return CGSizeMake((self.view.frame.size.width-10)/2,300);
    }
}

@end
