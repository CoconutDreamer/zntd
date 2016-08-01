//
//  FlowerViewController.m
//  zntd
//
//  Created by x c on 16/7/29.
//  Copyright © 2016年 x c. All rights reserved.
//

#import "FlowerViewController.h"
#import "MZTimerLabel.h"
@interface FlowerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *aUIlabel;
@property (strong,nonatomic)IBOutlet MZTimerLabel *stopwatch;

@end

@implementation FlowerViewController
- (IBAction)stopButtonPressed:(id)sender {
    
    
}
- (IBAction)startCountDownWithDelegate:(id)sender {
    
    if(![_stopwatch counting]){
        [_stopwatch start];
    }
}
- (IBAction)pauseCountDownWithDelegate:(id)sender {
    
    if([_stopwatch counting]){
        [_stopwatch pause];
    }
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"现在要去休息吗？花会枯萎哦！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesaction=[UIAlertAction actionWithTitle:@"去玩耍" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        //跳转到枯萎的花
    }];
    
    UIAlertAction *noaction=[UIAlertAction actionWithTitle:@"坚持" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [_stopwatch start];
    }];
    [alert addAction:yesaction];
    [alert addAction:noaction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    
    NSString *msg = [NSString stringWithFormat:@"Countdown of Example 6 finished!\nTime counted: %i seconds",(int)countTime];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:msg delegate:nil cancelButtonTitle:@"Awesome!" otherButtonTitles:nil];
    [alertView show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //_stopwatch = [[MZTimerLabel alloc] initWithLabel:_aUIlabel];
    //[_stopwatch start];
    
    _stopwatch = [[MZTimerLabel alloc] initWithLabel:_aUIlabel andTimerType:MZTimerLabelTypeTimer];
    [_stopwatch setCountDownTime:3600];
    _stopwatch.delegate = self;
    [_stopwatch start];
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
