//
//  Display_Score.m
//  Instrument
//
//  Created by Louis Ellis on 5/9/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "Display_Score.h"

@implementation Display_Score

@synthesize musicScoreView;
@synthesize imageOne, imageTwo, imageThree, imageFour, imageFive;
@synthesize ScrollHolderView;
@synthesize image_selected;




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"Called");
           
        
        
        

    }
    return self;
}


- (id)init{
    self = [super init];
    if (self) {
        // Initialization code
               
        
        
    }
    return self;
}


-(void)change_score:(int)score_number{
    
    NSLog(@"num %d", score_number);
    switch (score_number) {
        case 1:
          
          
            musicScoreView.image = imageOne;
            [musicScoreView setImage:imageOne];

            [musicScoreView setNeedsDisplay];
           


            NSLog(@"1");


            break;
        case 2:
            musicScoreView.image = imageOne;
            [musicScoreView setImage:imageOne];

            [musicScoreView setNeedsDisplay];
            


            NSLog(@"2");


            break;
        case 3:
          
           
            musicScoreView.image = imageOne;
            [musicScoreView setImage:imageOne];
            [musicScoreView setNeedsDisplay];
         
           

            NSLog(@"3");


            break;
        case 4:
            musicScoreView.image = imageFour;
            break;
        case 5:
            musicScoreView.image = imageFive;
            break;
        default:
            break;
    }
    
    
    
  
 
}




- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    
    NSLog(@"Called");
         
    /*
    CGRect frameMusicScore = musicScoreView.frame;
    frameMusicScore = musicScoreView.frame;
    frameMusicScore.origin.x = 0;
    frameMusicScore.origin.y = 0;
    frameMusicScore.size.width = 836;
    frameMusicScore.size.height = 800;
    
    musicScoreView.frame = frameMusicScore;
   
    */
    // Initialization code
   
    
    imageOne=	[UIImage imageNamed:@"02astimegoesby.png"] ;
    imageTwo=	[UIImage imageNamed:@"alleycat.png"] ;
    imageThree=	[UIImage imageNamed:@"br_im2_format0.png"] ;
    imageFour=	[UIImage imageNamed:@"chpn_op7_2.png"] ;
    imageFive=	[UIImage imageNamed:@"mos_op36_6_format0.png"] ;
    
    image_selected= imageFive;
    musicScoreView.image = image_selected;


    
    CGSize scrollHolderSize = ScrollHolderView.frame.size;
    scrollHolderSize.height *= 3;
    ScrollHolderView.showsVerticalScrollIndicator = YES;
    [ScrollHolderView setContentSize:scrollHolderSize];
    
    
    


    
}


@end
