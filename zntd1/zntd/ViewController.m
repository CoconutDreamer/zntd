//
//  ViewController.m
//  zntd
//
//  Created by x c on 16/7/14.
//  Copyright © 2016年 x c. All rights reserved.
//

#import "ViewController.h"
#import "MZTimerLabel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *aUIlabel;
@property (weak, nonatomic) IBOutlet UIButton *plantButton;
@property (weak, nonatomic) IBOutlet UILabel *plantnotice;
@property(strong,nonatomic) MZTimerLabel *stopwatch;
@property (weak, nonatomic) IBOutlet UIButton *relaxbutton;
@property(nonatomic) NSInteger level;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //倒计时
    _stopwatch = [[MZTimerLabel alloc] initWithLabel:_aUIlabel andTimerType:MZTimerLabelTypeTimer];
    [_stopwatch setCountDownTime:5];//设置倒计时长
    _stopwatch.delegate = self;
    //设置等级
    if(!_plantButton.currentBackgroundImage){
       [_plantButton setBackgroundImage:[UIImage imageNamed:@"a.png"] forState:UIControlStateNormal];

    }
    
    
    _level = 1;

    
}
- (IBAction)plantButtonPressed:(id)sender {
    //显示标签
    _aUIlabel.hidden=NO;
    _plantnotice.hidden=YES;
    _relaxbutton.hidden=NO;
    [_stopwatch start];//开始倒计
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCountDownWithDelegate:(id)sender {
    //开始倒计的函数
    if(![_stopwatch counting]){
        [_stopwatch start];
    }
}
- (IBAction)pauseCountDownWithDelegate:(id)sender {
    //暂停倒计时
    
    if([_stopwatch counting]){
        [_stopwatch pause];
    }
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"现在要去休息吗？花会枯萎哦！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesaction=[UIAlertAction actionWithTitle:@"去玩耍" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        //点击去玩耍选项相应的代码。。
    }];
    
    UIAlertAction *noaction=[UIAlertAction actionWithTitle:@"坚持" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        //坚持选项，倒计时继续倒计
        [_stopwatch start];
    }];
    [alert addAction:yesaction];
    [alert addAction:noaction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    //倒计时结束后。。。
    //组件的显示和隐藏
    _aUIlabel.hidden=YES;
    _plantnotice.hidden=NO;
    _relaxbutton.hidden=YES;
    [self nextLevel];
}
- (IBAction)nextLevel{
    
    switch (_level) {
        case 1:
            [_plantButton setBackgroundImage:[UIImage imageNamed:@"b.png"] forState:UIControlStateNormal];
            _level++;
            break;
        case 2:
            [_plantButton setBackgroundImage:[UIImage imageNamed:@"c.png"] forState:UIControlStateNormal];
            _level++;
            break;
        case 3:
            [_plantButton setBackgroundImage:[UIImage imageNamed:@"d.png"] forState:UIControlStateNormal];
            _level++;
            break;
        case 4:
            [_plantButton setBackgroundImage:[UIImage imageNamed:@"e.png"] forState:UIControlStateNormal];
//最后一个阶段，种完应该。。。
            break;
            
        default:
            
            break;
    }
    
    
    
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
