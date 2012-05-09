//
//  Display_music.h
//  Instrument
//
//  Created by Louis Ellis on 5/7/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioToolbox/MusicPlayer.h"


@interface Display_music : UIView{
    
    
    UIScrollView *songScrollView;
    UIScrollView *ScrollHolderView;

    UIImageView *musicScoreView;
    

}
@property (nonatomic, retain) IBOutlet UIScrollView *songScrollView;
@property (nonatomic, retain) IBOutlet UIScrollView *ScrollHolderView;

@property (nonatomic, retain) IBOutlet UIImageView *musicScoreView;

@property (nonatomic, retain) IBOutlet UIImage *imageOne;
@property (nonatomic, retain) IBOutlet UIImage *imageTwo;
@property (nonatomic, retain) IBOutlet UIImage *imageThree;
@property (nonatomic, retain) IBOutlet UIImage *imageFour;
@property (nonatomic, retain) IBOutlet UIImage *imageFive;








-(IBAction)buttonTrigger:(id)sender;
@property (nonatomic) MusicSequence midi_Loader;
@property (nonatomic) MusicPlayer midi_player;

@end
