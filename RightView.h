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
#import "LearnSong.h"

//#import "mobilesynthViewController.h"

@class mobilesynthViewController;
 
@interface RightView : UIViewController <UISplitViewControllerDelegate, UIWebViewDelegate>
{
    IBOutlet UILabel *lbltitle;
    NSDictionary *newsdetail;
    id detailItem;
    UINavigationBar *navigationBar;    
    LearnSong * loadSong;
    IBOutlet UIWebView *webView;
    mobilesynthViewController * learn;


}
-(IBAction)buttonTrigger:(id)sender;
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar; 
@property (nonatomic,retain)NSDictionary *newsDict;
@property (nonatomic, retain) id detailItem;
@property (nonatomic) MusicSequence midi_Loader;
@property (nonatomic) MusicPlayer midi_player;
@property (nonatomic, retain) LearnSong *loadSong;
@property (nonatomic, retain)  mobilesynthViewController *learn;

@property (nonatomic, retain) UIWebView *webView;
@end
