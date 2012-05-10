//
//  Display_music.h
//  Instrument
//
//  Created by Louis Ellis on 5/7/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioToolbox/MusicPlayer.h"
#import "Display_Score.h"

//@class Display_score;

@interface Display_music : UIView{
    
    
    UIScrollView *songScrollView;
    Display_Score * scoreView;  
    

}
@property (nonatomic, retain) IBOutlet UIScrollView *songScrollView;
@property (nonatomic, strong) IBOutlet Display_Score * scoreView;  



-(IBAction)buttonTrigger:(id)sender;

@property (nonatomic) MusicSequence midi_Loader;
@property (nonatomic) MusicPlayer midi_player;


@end
