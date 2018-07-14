//
//  ViewController.m
//  XHCard
//
//  Created by 信昊 on 2018/7/14.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "ViewController.h"
#import "XHCardSwitchView.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XHCardSwitchView *xhcard = [[XHCardSwitchView alloc]initWithFrame:CGRectMake(0, 100,[UIScreen mainScreen].bounds.size.width, 400)];
    [xhcard initCard:[self cardArr]];
    [self.view addSubview:xhcard];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSArray *)cardArr{
    NSMutableArray *muarr = [[NSMutableArray alloc]init];
    
    UIView *card1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-120, 350)];
    card1.backgroundColor = [UIColor redColor];
    [muarr addObject:card1];
    UIView *card2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-120, 350)];
    card2.backgroundColor = [UIColor greenColor];
    [muarr addObject:card2];
    UIView *card3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-120, 350)];
    card3.backgroundColor = [UIColor blackColor];
    [muarr addObject:card3];
    UIView *card4 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-120, 350)];
    card4.backgroundColor = [UIColor blueColor];
    [muarr addObject:card4];
    
    return [muarr copy];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
