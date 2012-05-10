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

@property (nonatomic, strong) IBOutlet UIImageView *musicScoreView;
@property (nonatomic, strong) IBOutlet UIImage *imageOne;
@property (nonatomic, strong) IBOutlet UIImage *imageTwo;
@property (nonatomic, strong) IBOutlet UIImage *imageThree;
@property (nonatomic, strong) IBOutlet UIImage *imageFour;
@property (nonatomic, strong) IBOutlet UIImage *imageFive;
@property (nonatomic, strong) IBOutlet UIImage *image_selected;


@property (nonatomic, retain) IBOutlet UIScrollView *ScrollHolderView;

-(void)change_score:(int)score_number;





@end
