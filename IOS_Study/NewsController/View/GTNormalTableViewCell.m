#import "GTNormalTableViewCell.h"
#import "GTListItem.h"

@interface  GTNormalTableViewCell()

// 设置 Label 属性
@property(nonatomic,strong,readwrite) UILabel *titleLabel;
@property(nonatomic,strong,readwrite) UILabel *sourceLabel;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;
@property(nonatomic,strong,readwrite) UILabel *timeLabel;
@property(nonatomic,strong,readwrite) UIImageView *rightImageView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;

@end

@implementation GTNormalTableViewCell


// 重写初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        // 添加图片
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 100, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        
//        // 添加按钮
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 78, 30, 20)];
//            [self.deleteButton setTitle:@"X" forState: UIControlStateNormal];
//            [self.deleteButton setTitle:@"V" forState: UIControlStateHighlighted];
//            self.deleteButton.backgroundColor = [UIColor orangeColor];
//            
//            // 添加 target action
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//            
//            self.deleteButton;
//        })];
    }
    return self;
};


// 创建一个方法  在.h 中暴露
- (void) layoutTableViewCellWithItem: (GTListItem *)item{
//-(void) layoutTableViewCell{
    self.titleLabel.text =item.title;
    self.sourceLabel.text=item.authorName;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text= item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y , self.commentLabel.frame.size.width,self.commentLabel.frame.size.height);
    
    self.timeLabel.text= item.date;
    [self.timeLabel sizeToFit];
    
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y , self.timeLabel.frame.size.width,self.timeLabel.frame.size.height);
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
    
    self.rightImageView.image = image;
}


-(void) deleteButtonClick{
      NSLog(@"deleteButtonClick");
}

@end
