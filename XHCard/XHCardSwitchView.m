//
//  XHCardSwitchView.m
//  XHCard
//
//  Created by 信昊 on 2018/7/14.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "XHCardSwitchView.h"

@interface XHCardSwitchView()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *XHScrollView;

@property(nonatomic,assign)NSInteger currentIndex;

@end

@implementation XHCardSwitchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _XHScrollView = [[UIScrollView alloc]initWithFrame:frame];
        _XHScrollView.backgroundColor = [UIColor clearColor];
        _XHScrollView.delegate = self;
        [self addSubview:_XHScrollView];
    }
    return self;
}
-(void)initCard:(NSArray *)cardArr{ //数据源
    CGFloat space = 0;
    CGFloat width = 0;
    CGFloat viewWidth = 0;
    for (UIView *cardView in cardArr) {
        NSInteger index = [cardArr indexOfObject:cardView];
        if (index == 0) {
            viewWidth = cardView.bounds.size.width;
        }
        space = self.frame.size.width - viewWidth;
        width = space/4+viewWidth;
        cardView.frame = CGRectMake(space/2 + (cardView.frame.size.width + space/4)*index, 0, viewWidth, cardView.frame.size.height);
        //形变
        
        CGFloat y = index *width;
        CGFloat value = (0-y)/width;
        CGFloat scale = fabs(cos(fabs(value)*M_PI/4));
        
        cardView.transform = CGAffineTransformMakeScale(1.0, scale);
         [_XHScrollView addSubview:cardView];
    }
        _XHScrollView.contentSize = CGSizeMake((space/2 + width*cardArr.count)+space/4, _XHScrollView.frame.size.height);
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{//滑动
    CGFloat offset = scrollView.contentOffset.x;
    if (offset < 0) {
        return;
    }
    CGFloat space = 0;
    CGFloat width = 0;
    CGFloat viewWidth = 0;
    for (UIView *cardView in _XHScrollView.subviews) {
        NSInteger index = [_XHScrollView.subviews indexOfObject:cardView];
        if (index == 0) {
            viewWidth = cardView.bounds.size.width;
        }
        space = self.frame.size.width - viewWidth;
        width = space/4+viewWidth;
        //形变
        
        CGFloat y = index *width;
        CGFloat value = (offset-y)/width;
        CGFloat scale = fabs(cos(fabs(value)*M_PI/4));
        
        cardView.transform = CGAffineTransformMakeScale(1.0, scale);

    }
    float a = offset/(viewWidth + space/4); //当前选中的是哪个。
    NSLog(@"%lf",offset);
    NSLog(@"%lf",viewWidth+space/4);
    if (a - (int)a > 0.5) {
        _currentIndex = (int)a + 1;
    } else {
        _currentIndex = (int)a;
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self sendCardCenter];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self sendCardCenter];
}
- (void)sendCardCenter {
    float space = 0;
    float viewWidth = 0;
    for (UIView *view in _XHScrollView.subviews) {
        NSInteger index = [_XHScrollView.subviews indexOfObject:view];
        
        if (index == 0) {
            viewWidth = view.frame.size.width;
        }
        space = self.frame.size.width - viewWidth;
    }
    
    [_XHScrollView scrollRectToVisible:CGRectMake(_currentIndex*(viewWidth + space/4), 0, _XHScrollView.frame.size.width, _XHScrollView.frame.size.height) animated:YES];//
    
  
}


@end
