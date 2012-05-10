//
//  Display_Score.h
//  Instrument
//
//  Created by Louis Ellis on 5/9/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSObject;

@interface Display_Score : UIView 
{
    
    
    UIImageView *musicScoreView;
    UIScrollView *ScrollHolderView;

}

@property (nonatomic, retain) IBOutlet UIImageView *musicScoreView;
@property (nonatomic, retain) IBOutlet UIImage *imageOne;
@property (nonatomic, retain) IBOutlet UIImage *imageTwo;
@property (nonatomic, retain) IBOutlet UIImage *imageThree;
@property (nonatomic, retain) IBOutlet UIImage *imageFour;
@property (nonatomic, retain) IBOutlet UIImage *imageFive;


@property (nonatomic, retain) IBOutlet UIScrollView *ScrollHolderView;

-(void)change_score:(int)score_number;





@end
