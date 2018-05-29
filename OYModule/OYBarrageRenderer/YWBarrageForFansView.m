//
//  YWBarrageForFansView.m
//  TxLiveTest
//
//  Created by 欧阳高俊 on 2018/5/28.
//  Copyright © 2018年 欧阳高俊. All rights reserved.
//

#import "YWBarrageForFansView.h"

#define imageWidth 30.f

@interface YWBarrageForFansView()

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,assign)NSTimeInterval time;
@property(nonatomic,copy)NSString *text;

@end

// view圆角
#define OYViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]];


#define OYRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]


@implementation YWBarrageForFansView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self loadSubviews];
    }
    return self;
}

- (void)loadSubviews{
    _imageView = [[UIImageView alloc]init];
    [self addSubview:self.imageView];
    
    _titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:self.titleLabel];
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, imageWidth, imageWidth);
    self.titleLabel.frame = CGRectMake(imageWidth, 0, self.bounds.size.width-imageWidth, self.bounds.size.height);
    self.backgroundColor=[UIColor grayColor];
    OYViewBorderRadius(self.imageView, 15, 0, [UIColor clearColor]);
    OYViewBorderRadius(self, 15, 0, [UIColor clearColor]);
}

- (CGSize)sizeThatFits:(CGSize)size{
    UILabel *prototypeLabel = self.titleLabel;
    CGSize titleSize = [prototypeLabel sizeThatFits:CGSizeMake(10000, 10)];
    return CGSizeMake(titleSize.width+imageWidth, titleSize.height>imageWidth?titleSize.height:imageWidth);
}

#pragma mark - BarrageViewProtocol

- (void)configureWithParams:(NSDictionary *)params{
    [super configureWithParams:params];
    self.text = params[@"text"];
    [self updateTexts];

}

- (void)updateWithTime:(NSTimeInterval)time{
    //更新弹幕动画
//    [self updateTexts];
}

- (void)updateTexts{
    if (!self.text) {
        return;
    }
    self.titleLabel.text = self.text;
    self.titleLabel.textColor = OYRandomColor;
    self.imageView.image = [UIImage imageNamed:@"avatar"];
}


@end
