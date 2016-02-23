//
//  ViewController.m
//  EPCircleProgressViewDemo
//
//  Created by autobot on 16/2/23.
//  Copyright © 2016年 enoughpower. All rights reserved.
//

#import "ViewController.h"
#import "EPCircleProgressView.h"

@interface ViewController ()
@property (nonatomic, strong)EPCircleProgressView *epv1;
@property (nonatomic, strong)EPCircleProgressView *epv2;
@property (nonatomic, strong)EPCircleProgressView *epv3;
@property (nonatomic, strong)EPCircleProgressView *epv4;
@property (nonatomic, strong)EPCircleProgressView *epv5;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.epv1= [[EPCircleProgressView alloc]initWithFrame:CGRectMake(100, 100, 100, 100) Style:EPCircleProgressStyleSquare];
    self.epv1.LineColor = [UIColor redColor];
    [self.view addSubview:_epv1];
    
    self.epv2= [[EPCircleProgressView alloc]initWithFrame:CGRectMake(100, 200, 100, 100) Style:EPCircleProgressStyleRound];
    self.epv2.LineWidth = 10.f;
    self.epv2.LineColor = [UIColor blueColor];
    [self.view addSubview:_epv2];
    
    self.epv3= [[EPCircleProgressView alloc]initWithFrame:CGRectMake(100, 300, 200, 200) Style:EPCircleProgressStyleSquareText];
    self.epv3.textColor = [UIColor blackColor];
    self.epv3.LineWidth = 30.f;
    self.epv3.LineColor = [UIColor yellowColor];
    [self.view addSubview:_epv3];
    
    self.epv4= [[EPCircleProgressView alloc]initWithFrame:CGRectMake(200, 100, 100, 100) Style:EPCircleProgressStyleRoundText];
    self.epv4.LineColor = [UIColor cyanColor];
    [self.view addSubview:_epv4];
    
    self.epv5= [[EPCircleProgressView alloc]initWithFrame:CGRectMake(200, 200, 100, 100) Style:EPCircleProgressStyleSector];
    self.epv5.LineColor = [UIColor purpleColor];
    [self.view addSubview:_epv5];
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 500, 275, 44)];
    [slider addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
}

- (void)change:(UISlider *)sender
{
    self.epv1.progress = sender.value;
    self.epv2.progress = sender.value;
    self.epv3.progress = sender.value;
    self.epv4.progress = sender.value;
    self.epv5.progress = sender.value;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
