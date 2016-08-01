//
//  ViewController.m
//  ZNTD-0722-3
//
//  Created by 姚泽铭 on 7/22/16.
//  Copyright © 2016 nick. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *currentFlower;
@property(nonatomic) NSInteger level;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(!_currentFlower.image)
        _currentFlower.image = [UIImage imageNamed:@"a.png"];
    _level = 1;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextLevel:(id)sender {
    
    
    
    switch (_level) {
        case 1:
            _currentFlower.image = [UIImage imageNamed:@"b.png"];
            _level++;
            break;
        case 2:
            _currentFlower.image = [UIImage imageNamed:@"c.png"];
            _level++;
            break;
        case 3:
            _currentFlower.image = [UIImage imageNamed:@"d.png"];
            _level++;
            break;
        case 4:
            _currentFlower.image = [UIImage imageNamed:@"e.png"];
            break;
            
        default:
            
            break;
    }
    
    
  
    
    
}

@end
