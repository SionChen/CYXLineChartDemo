//
//  ViewController.m
//  CFLineChartDemo
//
//  Created by Cyx on 16/3/24.
//  Copyright © 2016年 Cyx. All rights reserved.
//

#import "ViewController.h"
#import "CFLineChartView.h"
#import <objc/runtime.h>
@interface ViewController ()<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *lineSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *pointSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *pliterSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pointtypeSegment;
@property (weak, nonatomic) IBOutlet UISwitch *valueSwitch;

@property (nonatomic, strong) CFLineChartView *LCView;
@end

@implementation ViewController
- (IBAction)segmentValuesChangeAction:(id)sender {
    
    [self setupConditions];
}

- (IBAction)switchValueChangeAction:(UISwitch *)sender {

    [self setupConditions];
}


// static const char *Test = "good";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self doWithCreateUI];
    
}


- (void)doWithCreateUI{
    CFLineChartView *LCView = [CFLineChartView lineChartViewWithFrame:CGRectMake(10, 60, CGRectGetWidth([UIScreen mainScreen].bounds) - 20, 180)];
    LCView.xValues = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    LCView.yValues = @[@35, @5, @80, @40, @50, @13, @50, @75,@25, @100, @64, @95, @33, @100];
    
    self.LCView = LCView;
    
    [self.view addSubview:self.LCView];
    
    [self setupConditions];
}


// 设置条件
- (void)setupConditions{
    self.LCView.isShowLine = self.lineSwitch.on;
    self.LCView.isShowPoint = self.pointSwitch.on;
    self.LCView.isShowPillar = self.pliterSwitch.on;
    self.LCView.isShowValue = self.valueSwitch.on;
    
    [self.LCView drawChartWithLineChartType:self.segment.selectedSegmentIndex pointType:self.pointtypeSegment.selectedSegmentIndex];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
