//
//  ViewController.h
//  SideScrolling
//
//  Created by shijia hu on 3/2/17.
//  Copyright © 2017 shijia hu. All rights reserved.
//

#import <UIKit/UIKit.h>



int BoyJump;
int RandTopCols;
int RandBottomCols;
int Score;

@interface ViewController : UIViewController{
    IBOutlet UIImageView *columnTop;
    IBOutlet UIImageView *columnBottom;
    IBOutlet UIImageView *boy;
    IBOutlet UIImageView *top;
    IBOutlet UIImageView *bottom;
    IBOutlet UIButton *start;
    IBOutlet UILabel *score;
    IBOutlet UIButton *restart;
    IBOutlet UIImageView *coin1;
    IBOutlet UIImageView *coin2;
    IBOutlet UIImageView *coin3;
    IBOutlet UIImageView *coin4;
    
    NSTimer *BoyMove;
    NSTimer *ColumnMove;
    
    
}

@property (nonatomic, strong) NSMutableArray *coinArr;

- (IBAction)start:(id)sender;
- (void)BoyMoving;
- (void)ColumnMoving;
- (void)ReDrawColumns;
- (void)GameOver;
- (IBAction)restart:(id)sender;


@end

