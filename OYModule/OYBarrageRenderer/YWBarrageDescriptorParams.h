//
//  YWBarrageDescriptorParams.h
//  TxLiveTest
//
//  Created by 欧阳高俊 on 2018/5/28.
//  Copyright © 2018年 欧阳高俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <BarrageRenderer/BarrageHeader.h>
#import <YYKit/YYKit.h>


@interface YWBarrageDescriptorParams : NSObject

@property (nonatomic,copy) NSString  *bizMsgId;
@property (nonatomic,copy) NSString  *spriteName;

#pragma  mark =====UIView=====
@property (nonatomic,strong) NSNumber *borderWidth;
@property (nonatomic,strong) UIColor *borderColor;
@property (nonatomic,strong) NSNumber *rotateRatio;
@property (nonatomic,strong) UIColor *backgroundColor;

#pragma  mark =====UIImageView=====
@property (nonatomic,strong) UIImage *image;

#pragma  mark =====UILabel=====
@property (nonatomic,copy) NSString  *text;

@property (nonatomic,strong) NSArray *titles;

@property (nonatomic,strong) UIColor *textColor;

@property (nonatomic,strong) UIColor *shadowColor;

@property (nonatomic,assign) CGSize shadowOffset;

@property (nonatomic,strong) NSNumber *fontSize;

@property (nonatomic,copy) NSString  *fontFamily;

@property (nonatomic,strong) NSAttributedString *attributedText;



@property (nonatomic,strong) NSNumber *scaleRatio;

@property (nonatomic,strong) NSNumber *duration;

//呈现具体弹幕,视图类名(UILabel/MLEmojiLabel/)
@property (nonatomic,copy) NSString  *viewClassName;

@property (nonatomic,strong) NSNumber *fadeInTime;
@property (nonatomic,strong) NSNumber *fadeOutTime;

//BarrageFloatSide 浮动弹幕位置
@property (nonatomic,strong) NSNumber  *side;

//轨道数量
@property (nonatomic,strong) NSNumber *trackNumber;

@property (nonatomic,strong) NSNumber *speed;

@property (nonatomic,strong) NSNumber *direction;

@property (nonatomic,strong) NSNumber *delay;

@property (nonatomic,copy) BarrageClickAction clickAction;

@property (nonatomic,strong) BarrageDescriptor *descriptor;


-(BarrageDescriptor *)barrageDescriptorWithSelf;

/**
 弹幕数据实例化

 @param spriteName 弹幕的类型(BarrageSprite及子类) 类名
 @param className 自定义弹幕样式(遵循BarrageViewProtocol协议的自定义视图) 类名
 @return 返回弹幕数据
 */
-(instancetype)initWithSpriteName:(nonnull NSString *)spriteName viewClassName:(NSString *)className;

@end
