//
//  RightView.h
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AudioToolbox/MusicPlayer.h"


@interface RightView : UIViewController <UISplitViewControllerDelegate>
{
    IBOutlet UILabel *lbltitle;
    NSDictionary *newsdetail;
    id detailItem;
    UINavigationBar *navigationBar;    


}
-(IBAction)buttonTrigger:(id)sender;
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar; 
@property (nonatomic,retain)NSDictionary *newsDict;
@property (nonatomic, retain) id detailItem;
@property (nonatomic) MusicSequence midi_Loader;
@property (nonatomic) MusicPlayer midi_player;
@end
