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

}
@property (nonatomic, retain) IBOutlet UIScrollView *songScrollView;
-(IBAction)buttonTrigger:(id)sender;
@property (nonatomic) MusicSequence midi_Loader;
@property (nonatomic) MusicPlayer midi_player;

@end
