//
//  ViewController.m
//  SideScrolling
//
//  Created by shijia hu on 3/2/17.
//  Copyright © 2017 shijia hu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (IBAction)start:(id)sender{
    
    Score = 0;
    start.hidden = YES;
    columnTop.hidden = NO;
    columnBottom.hidden = NO;
    coin1.hidden = NO;
    coin2.hidden = NO;
    coin3.hidden = NO;
    coin4.hidden = NO;
    BoyMove = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BoyMoving) userInfo:nil repeats:YES];
    ColumnMove = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ColumnMoving) userInfo:nil repeats:YES];
    
    [self ReDrawColumns];
}

- (IBAction)restart:(id)sender{
    
    Score = 0;
    restart.hidden = YES; 
    start.hidden = YES;
    columnTop.hidden = NO;
    columnBottom.hidden = NO;
    boy.hidden = NO;
    coin1.hidden = NO;
    coin2.hidden = NO;
    coin3.hidden = NO;
    coin4.hidden = NO;
    boy.center = CGPointMake(103, 331);
    BoyMove = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BoyMoving) userInfo:nil repeats:YES];
    ColumnMove = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ColumnMoving) userInfo:nil repeats:YES];
    
    [self ReDrawColumns];
    
    score.text = @"0";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BoyJump = 30;
    
}
- (void)BoyMoving{
    boy.center = CGPointMake(boy.center.x, boy.center.y - BoyJump);
    
    
    BoyJump = BoyJump - 5;
    if (BoyJump < -15) {
        BoyJump = -15;
    }
    if (boy.center.y > 613) {
        boy.center = CGPointMake(boy.center.x, 613);;
    }
    
}
- (void)ColumnMoving{
    columnTop.center = CGPointMake(columnTop.center.x - 1, columnTop.center.y);
    columnBottom.center = CGPointMake(columnBottom.center.x - 1, columnBottom.center.y);
    if (columnTop.center.x == 39 ) {
        [self ReDrawColumns];
    }
    
    if (CGRectIntersectsRect(boy.frame, columnTop.frame) || CGRectIntersectsRect(boy.frame, columnBottom.frame) ) {
        [self GameOver];
    }
    
    if (columnBottom.center.x == 42) {
        Score = Score + 1;
        score.text = [NSString stringWithFormat:@"%i", Score];
    }
    coin1.center = CGPointMake(coin1.center.x - 1, coin1.center.y);
    coin2.center = CGPointMake(coin2.center.x - 1, coin2.center.y);
    coin3.center = CGPointMake(coin3.center.x - 1, coin3.center.y);
    coin4.center = CGPointMake(coin4.center.x - 1, coin4.center.y);
    
    
    if (CGRectIntersectsRect(boy.frame, coin1.frame) ) {
        coin1.hidden = YES;
        Score = Score + 1;
        score.text = [NSString stringWithFormat:@"%i", Score];
    }else if (CGRectIntersectsRect(boy.frame, coin2.frame)){
        coin2.hidden = YES;
        Score = Score + 1;
        score.text = [NSString stringWithFormat:@"%i", Score];
    }else if (CGRectIntersectsRect(boy.frame, coin3.frame)){
        coin3.hidden = YES;
        Score = Score + 1;
        score.text = [NSString stringWithFormat:@"%i", Score];
    }else if (CGRectIntersectsRect(boy.frame, coin4.frame) || coin4.center.x == 39){
        coin4.hidden = YES;
        Score = Score + 1;
        
        
        score.text = [NSString stringWithFormat:@"%i", Score];
    }
    

}

- (void)ReDrawColumns{
    coin1.hidden = NO;
    coin2.hidden = NO;
    coin3.hidden = NO;
    coin4.hidden = NO;
    RandTopCols = arc4random() % 350;
    RandTopCols = RandTopCols - 220;
    RandBottomCols = RandTopCols + 555;
    
    columnTop.center = CGPointMake(340, RandTopCols);
    columnBottom.center = CGPointMake(340, RandBottomCols);
    
    coin1.center = CGPointMake(95, RandTopCols+250);
    coin2.center = CGPointMake(127, RandBottomCols-200);
    coin3.center = CGPointMake(159, RandTopCols+250);
    coin4.center = CGPointMake(191, RandBottomCols-250);
    if (Score % 3 == 0 && Score>5) {
        coin1.center = CGPointMake(95, 600);
        coin2.center = CGPointMake(127, 600);
        coin3.center = CGPointMake(159, 600);
        coin4.center = CGPointMake(191, 600);
    }
    
}

- (void)GameOver{
    columnTop.hidden = YES;
    columnBottom.hidden = YES;
    start.hidden = YES;
    boy.hidden = YES;
    restart.hidden = NO;
    coin1.hidden = YES;
    coin2.hidden = YES;
    coin3.hidden = YES;
    coin4.hidden = YES;
    [BoyMove invalidate];
    [ColumnMove invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    columnTop.hidden = YES;
    columnBottom.hidden = YES;
    restart.hidden = YES;
    coin1.hidden = YES;
    coin2.hidden = YES;
    coin3.hidden = YES;
    coin4.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
