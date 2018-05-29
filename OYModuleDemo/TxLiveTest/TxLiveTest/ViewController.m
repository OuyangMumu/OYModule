//
//  ViewController.m
//  TxLiveTest
//
//  Created by 欧阳高俊 on 2018/5/28.
//  Copyright © 2018年 欧阳高俊. All rights reserved.
//

#import "ViewController.h"
#import "YWBarrageDescriptorParams.h"
#import  <BarrageRenderer/BarrageHeader.h>
#import "YWBarrageForFansView.h"
#import "FlowerBarrageSprite.h"
#import "UIImage+Barrage.h"
#import "MLEmojiLabel.h"
#import <BlocksKit/BlocksKit.h>


@interface ViewController ()<BarrageRendererDelegate>

@property (weak, nonatomic) IBOutlet UIView *showView;
@property (nonatomic,strong) BarrageRenderer *BarrageRenderer;
@property (nonatomic,strong) NSDate *startTime;
@property (nonatomic,assign) NSTimeInterval predictedTime;//快进时间
@property (nonatomic,assign) NSInteger  index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.showView addSubview:self.BarrageRenderer.view];
    [self.showView sendSubviewToBack:self.BarrageRenderer.view];
    [self.BarrageRenderer start];
}

- (IBAction)buttonClick:(UIButton *)sender {

    self.startTime=[NSDate new];
    NSInteger const number = 100;
    NSMutableArray * descriptors = [[NSMutableArray alloc]init];
    
    switch (sender.tag) {
        case 11:
        {
        NSTimer *timer  =  [NSTimer bk_scheduledTimerWithTimeInterval:0.2 block:^(NSTimer *timer) {
                
                for(int i=0;i<10;i++){
                    [self.BarrageRenderer receive:[self walkTextSpriteDescriptorWithDirection:BarrageWalkDirectionR2L side:BarrageWalkSideLeft]];
                }
            
            [self.BarrageRenderer receive:[self YWBarrageForFansViewSpriteDescriptorWithDirection:BarrageWalkDirectionR2L side:BarrageWalkSideRight]];
            
            } repeats:YES];
            
            [timer fire];
        }
            
            break;
          
        case 12:
            
            break;
        case 13:
            
            break;
            
        case 1:
        {
            for (NSInteger i = 0; i < number; i++) {
                [descriptors addObject:[self walkTextSpriteDescriptorWithDirection:BarrageWalkDirectionR2L side:BarrageWalkSideLeft]];
            }
            [self.BarrageRenderer load:descriptors];
        }
            break;
            
        case 6:
        {
            for (NSInteger i = 0; i < number; i++) {
                self.index++;
                [descriptors addObject:[self YWBarrageForFansViewSpriteDescriptorWithDirection:BarrageWalkDirectionR2L side:BarrageWalkSideDefault]];
            }
            [self.BarrageRenderer load:descriptors];
          
        }
            break;
        case 2:
        {
            for (NSInteger i = 0; i < number; i++) {
                self.index++;
                [descriptors addObject:[self flowerImageSpriteDescriptor]];

            }
            [self.BarrageRenderer load:descriptors];
        }
            
            break;
            
        case 3:
        {
            for (NSInteger i = 0; i < number; i++) {
                self.index++;
                [descriptors addObject:[self floatTextSpriteDescriptorWithDirection:1 side:1]];
                
            }
            [self.BarrageRenderer load:descriptors];
        }
            
            break;
            
        case 4:
        {
            for (NSInteger i = 0; i < number; i++) {
                self.index++;
                [descriptors addObject:[self walkImageSpriteDescriptorWithDirection:1]];
                
            }
            [self.BarrageRenderer load:descriptors];
        }
            
            break;
            
        case 5:
        {
            for (NSInteger i = 0; i < number; i++) {
                self.index++;
                [descriptors addObject:[self floatImageSpriteDescriptorWithDirection:2]];
                
            }
            [self.BarrageRenderer load:descriptors];
        }
            
            break;
        default:
            break;
    }
    
}


/// 生成精灵描述 - 延时文字弹幕
- (BarrageDescriptor *)walkTextSpriteDescriptorWithDirection:(BarrageWalkDirection)direction side:(BarrageWalkSide)side{
    
    YWBarrageDescriptorParams *params=[[YWBarrageDescriptorParams alloc]initWithSpriteName: NSStringFromClass([BarrageWalkTextSprite class]) viewClassName:nil];

    params.bizMsgId=[NSString stringWithFormat:@"id:%ld",(long)self.index++];
    params.text=[NSString stringWithFormat:@"过场文字弹幕:%ld",(long)_index++];
    params.speed=@(100 * (double)random()/RAND_MAX+50);
    
    params.clickAction = ^(NSDictionary *params) {
        NSString *msg = [NSString stringWithFormat:@"弹幕 %@ 被点击",params[@"bizMsgId"]];
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [alertView show];
    };
    
    return [params barrageDescriptorWithSelf];
}

/// 演示自定义弹幕样式
- (BarrageDescriptor *)YWBarrageForFansViewSpriteDescriptorWithDirection:(BarrageWalkDirection)direction side:(BarrageWalkSide)side{
    NSString *titles2 = @"ʕ•̫͡•ʔʕ•̫͡•ʔʕ•̫͡•ʔʕ•̫͡•ʔʕ•̫͡•ʔ";
    
    YWBarrageDescriptorParams * params = [[YWBarrageDescriptorParams alloc]initWithSpriteName:NSStringFromClass([BarrageWalkSprite class]) viewClassName:@"YWBarrageForFansView"];
    
    params.speed = @(100 * (double)random()/RAND_MAX+50);
    params.side = @(side);
    params.text = titles2;
    __weak BarrageRenderer *render = self.BarrageRenderer;
    params.clickAction = ^(NSDictionary *params){
        [render removeSpriteWithIdentifier:params[@"identifier"]];
    };
    BarrageDescriptor *descriptor = [params barrageDescriptorWithSelf];

    return descriptor;
}

- (BarrageDescriptor *)flowerImageSpriteDescriptor{

    YWBarrageDescriptorParams *params=[[YWBarrageDescriptorParams alloc]initWithSpriteName:NSStringFromClass([FlowerBarrageSprite class]) viewClassName:@"UILabel"];
    params.image= [UIImage imageNamed:@"avatar"];
    params.duration = @(10);
    params.text = @"^*-*^";
    params.borderWidth = @(1);
    params.borderColor = [UIColor grayColor];
    params.scaleRatio = @(4);
    params.rotateRatio = @(100);
    
    return [params barrageDescriptorWithSelf];
}

/// 生成精灵描述 - 浮动文字弹幕
- (BarrageDescriptor *)floatTextSpriteDescriptorWithDirection:(NSInteger)direction side:(BarrageFloatSide)side
{
    
    YWBarrageDescriptorParams *parrams = [[YWBarrageDescriptorParams alloc]initWithSpriteName:NSStringFromClass([BarrageWalkTextSprite class]) viewClassName:@"MLEmojiLabel"];
    
    parrams.text = [NSString stringWithFormat:@"AA-图文混排/😢::B过场弹幕:%ld",(long)_index++];
    parrams.duration = @(3);
    parrams.fadeInTime = @(1);
    parrams.fadeOutTime = @(1);
    parrams.speed=@(100 * (double)random()/RAND_MAX+50);

    return [parrams barrageDescriptorWithSelf];
}

/// 生成精灵描述 - 过场图片弹幕
- (BarrageDescriptor *)walkImageSpriteDescriptorWithDirection:(NSInteger)direction{
    
    YWBarrageDescriptorParams *parrams = [[YWBarrageDescriptorParams alloc]initWithSpriteName:NSStringFromClass([BarrageWalkImageSprite class]) viewClassName:nil];
    parrams.image = [UIImage imageNamed:@"avatar"];
    parrams.speed = @(100 * (double)random()/RAND_MAX+50);
    parrams.borderColor=[UIColor greenColor];
    parrams.trackNumber = @5; // 轨道数量
    
    return [parrams barrageDescriptorWithSelf];
}

/// 生成精灵描述 - 浮动图片弹幕
- (BarrageDescriptor *)floatImageSpriteDescriptorWithDirection:(NSInteger)direction{
    
    YWBarrageDescriptorParams *parrams = [[YWBarrageDescriptorParams alloc]initWithSpriteName:NSStringFromClass([BarrageFloatImageSprite class]) viewClassName:nil];
    parrams.borderColor=[UIColor greenColor];
    parrams.image = [UIImage imageNamed:@"avatar"];
    parrams.duration = @(3);
    parrams.direction = @(direction);
    return [parrams barrageDescriptorWithSelf];
}



#pragma mark - BarrageRendererDelegate

/// 演示如何拿到弹幕的生命周期
- (void)barrageRenderer:(BarrageRenderer *)renderer spriteStage:(BarrageSpriteStage)stage spriteParams:(NSDictionary *)params
{
    NSString *subid = [params[@"identifier"] substringToIndex:8];
    if (stage == BarrageSpriteStageBegin) {
        NSLog(@"id:%@,bizMsgId:%@ =>进入",subid,params[@"bizMsgId"]);
    } else if (stage == BarrageSpriteStageEnd) {
        NSLog(@"id:%@,bizMsgId:%@ =>离开",subid,params[@"bizMsgId"]);
        /* 注释代码演示了如何复制一条弹幕
         BarrageDescriptor * descriptor = [[BarrageDescriptor alloc]init];
         descriptor.spriteName = NSStringFromClass([BarrageWalkTextSprite class]);
         [descriptor.params addEntriesFromDictionary:params];
         descriptor.params[@"delay"] = @(0);
         [renderer receive:descriptor];
         */
    }
}


- (NSTimeInterval)timeForBarrageRenderer:(BarrageRenderer *)renderer{
//    [self updateMockVideoProgress]; // 仅为演示
    NSTimeInterval interval = [[NSDate date]timeIntervalSinceDate:self.startTime];
    interval += self.predictedTime;
    return interval;
}


-(BarrageRenderer *)BarrageRenderer{
    if (!_BarrageRenderer) {
        _BarrageRenderer=[BarrageRenderer new];
        _BarrageRenderer.delegate=self;
        _BarrageRenderer.redisplay=YES;
        _BarrageRenderer.view.userInteractionEnabled=YES;
        _BarrageRenderer.smoothness=.2f;
    }
    return _BarrageRenderer;
}

@end
