//
//  SYShareView.m
//  zhihuDaily
//
//  Created by yang on 16/2/23.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SYShareView.h"


@interface SYShareView ()

@property (nonatomic, weak) UIView *shareView;

@end


@implementation SYShareView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:kScreenBounds];
    if (self) {
        self.backgroundColor = SYColor(128, 128, 128, 0);
    }
    return self;
}


- (void)handleTap {
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = SYColor(128, 128, 128, 0);
        self.shareView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight*0.5);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (void)show {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    UIView *shareView = [[SYShareView alloc] init];
    shareView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight*0.5);
    shareView.backgroundColor = [UIColor redColor];
    
    [self addSubview:shareView];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = SYColor(128, 128, 128, 0.8);
        shareView.frame = CGRectMake(0, kScreenHeight*0.5, kScreenWidth, kScreenHeight*0.5);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [self addGestureRecognizer:tap];
    self.shareView = shareView;
}

@end