//
//  RightView.m
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "RightView.h"
#import "LeftView.h"
#import "AudioToolbox/MusicPlayer.h"

@interface RightView ()

@end

@implementation RightView
@synthesize newsDict;
@synthesize detailItem;
@synthesize navigationBar;

@synthesize midi_Loader;
@synthesize midi_player;

- (void)setDetailItem:(id)newDetailItem {
    
    //Set the title   
    detailItem = newDetailItem;
    self.navigationItem.title = detailItem;
    
    
    
}

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
    
  	barButtonItem.title = @"Phone List";
    [navigationBar.topItem setLeftBarButtonItem:barButtonItem animated:YES];
 //   self.popoverController = pc;
	
	
}



// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
  	
   // self.popoverController = nil;
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) playMidiInBackground {
    
    // Create a new music sequence
    // Initialise the music sequence
    NewMusicSequence(&midi_Loader);
    
    // Get a string to the path of the MIDI file which
    // should be located in the Resources folder
    // I'm using a simple test midi file which is included in the download bundle at the end of this document
    NSString *midiFilePath = [[NSBundle mainBundle]
                              pathForResource:@"mary"
                              ofType:@"mid"];
    
    // Create a new URL which points to the MIDI file
    // NSURL * midiFileURL = [NSURL fileURLWithPath:midiFilePath];
    CFURLRef pdfURL = (__bridge CFURLRef)[NSURL fileURLWithPath:midiFilePath];
    //  CFURLRef sdfjsf = [
    //CFURLRef sdfsdf= [
    MusicSequenceFileLoad(midi_Loader, pdfURL, 0, 0);
    
    // Create a new music player
    // Initialise the music player
    NewMusicPlayer(&midi_player);
    
    // Load the sequence into the music player
    MusicPlayerSetSequence(midi_player, midi_Loader);
    // Called to do some MusicPlayer setup. This just
    // reduces latency when MusicPlayerStart is called
    MusicPlayerPreroll(midi_player);
    // Starts the music playing
    MusicPlayerStart(midi_player);
    
    MusicTrack t;
    MusicTimeStamp len;
    UInt32 sz = sizeof(MusicTimeStamp);
    MusicSequenceGetIndTrack(midi_Loader, 1, &t);
    MusicTrackGetProperty(t, kSequenceTrackProperty_TrackLength, &len, &sz);
    
    
    while (1) { // kill time until the music is over
        usleep (3 * 1000 * 1000);
        MusicTimeStamp now = 0;
        MusicPlayerGetTime (midi_player, &now);
        if (now >= len)
            break;
    }
    
    // Stop the player and dispose of the objects
    
    

}
- (void) stopSongInBackground {
    MusicPlayerStop(midi_player);
    DisposeMusicSequence(midi_Loader);
    DisposeMusicPlayer(midi_player);
    
}



-(IBAction)buttonTrigger:(id)sender{
    UIButton *theButton = (UIButton *)sender;
    NSString * buttonTitle = theButton.currentTitle;
    
    if([buttonTitle isEqualToString:@"Play Song"]){
        
        //[self performSelectorInBackground:@selector(playMidiInBackground) withObject:nil];
        NSLog((NSString *)[self.navigationController title]);
    }
    
    if([buttonTitle isEqualToString:@"Stop Song"]){
        
        [self performSelectorInBackground:@selector(stopSongInBackground) withObject:nil];
        
    }
    
    
    if([buttonTitle isEqualToString:@"Back"]){
        [self.navigationController popViewControllerAnimated:YES];//not to see pop
    }

    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
  //  NSURL *urlPathOfAudio;
    NSError *audioError;

       
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
