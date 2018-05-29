//
//  YWBarrageDescriptorParams.m
//  TxLiveTest
//
//  Created by 欧阳高俊 on 2018/5/28.
//  Copyright © 2018年 欧阳高俊. All rights reserved.
//

#import "YWBarrageDescriptorParams.h"
#import "YWBarrageForFansView.h"


@implementation YWBarrageDescriptorParams


-(instancetype)init{
    if (self=[super init]) {
        self.spriteName=NSStringFromClass([BarrageWalkTextSprite class]);
    }
    return self;
}


-(instancetype)initWithSpriteName:(nonnull NSString *)spriteName viewClassName:(NSString *)className{
    
    if (self=[super init]) {
        
        self.descriptor=[BarrageDescriptor new];
        self.descriptor.spriteName=spriteName;
        self.spriteName = spriteName;
        
        if ([spriteName isEqualToString:@"BarrageWalkTextSprite"] || [spriteName isEqualToString:@"BarrageFloatTextSprite"]) {
            self.textColor=[UIColor whiteColor];
        }
        
        if ([spriteName containsString:@"Walk"]) {//从右到左
            self.direction=@(BarrageWalkDirectionR2L);
        }
        
        if ([spriteName containsString:@"Float"]) {//居中悬浮
            self.side=@(BarrageFloatSideCenter);
        }
        
        
        if (className) {
            self.viewClassName = className;
        }
        
    }
    return self;
}

-(BarrageDescriptor *)barrageDescriptorWithSelf{
    
    NSDictionary *proterty = [self modelToJSONObject];
    [proterty enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@",key);
        if ([key isEqual:@"textColor"]) {
            self.descriptor.params[key]=self.textColor;
        }else if ([key isEqual:@"borderColor"]){
            self.descriptor.params[key]=self.borderColor;
        }else if ([key isEqual:@"backgroundColor"]){
            self.descriptor.params[key]=self.backgroundColor;
        }else if ([key isEqual:@"clickAction"]){
            self.descriptor.params[key]=self.clickAction;
        }else if ([key isEqual:@"image"]){
            self.descriptor.params[key]=self.image;
        }else{
            self.descriptor.params[key]=obj;
        }
    }];
    
    if (self.clickAction) {
        self.descriptor.params[@"clickAction"]=self.clickAction;
    }
    return self.descriptor;
}


@end
