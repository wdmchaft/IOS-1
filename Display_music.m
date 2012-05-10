//
//  Display_music.m
//  Instrument
//
//  Created by Louis Ellis on 5/7/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "Display_Score.h"
#import "Display_music.h"

@implementation Display_music
@synthesize songScrollView;
@synthesize midi_Loader;
@synthesize midi_player;
@synthesize scoreView;





- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.



NSString * selected_song=@"    As Time Goes By" ; 

- (void)drawRect:(CGRect)rect
{
    UILabel *section_title=[[UILabel alloc]initWithFrame:CGRectMake(400, 15 ,100,20 )];
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    [self addSubview:background];
    [self sendSubviewToBack:background];

    
    section_title.text=@"Song Name:";
    section_title.textColor =[UIColor whiteColor];
    section_title.BackgroundColor =[UIColor clearColor];
   
    songScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(300, 25 ,300,100 )];

    
    NSMutableArray *SongNames = [[NSMutableArray alloc] init]; 
    [SongNames addObject:@"    As Time Goes By"];
    [SongNames addObject:@"  Mary Had A little lamb"];
    [SongNames addObject:@"Flight Of The Bumble Bee"];
    [SongNames addObject:@"Carolina In The Morning"];
    [SongNames addObject:@" Alley Cat"];

    
    NSMutableArray *SongSelectViews = [[NSMutableArray alloc] init]; 
    
    for(int i=0;i<[SongNames count];i++){
        UIButton *songButton=[[UIButton alloc]initWithFrame:CGRectMake((40 * i), 10 ,40,20 )];

        [ songButton addTarget: self action: @selector( buttonTrigger: ) forControlEvents: UIControlEventTouchUpInside ];
        
        
        [songButton setTitle: [SongNames objectAtIndex:i] forState: UIControlStateNormal];
        [songButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        songButton.backgroundColor = [UIColor clearColor];
        [songButton setTitleColor:[UIColor redColor] forState:(UIControlStateHighlighted+UIControlStateSelected)];

        
        [SongSelectViews addObject:songButton];
    }
    
    scoreView = [[Display_Score alloc]initWithFrame:CGRectMake(100, 250 ,300,100 )] ;
   

    

    CGRect frame = songScrollView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = 300;
    
    
    for (int i = 0; i < [SongSelectViews count]; ++i) {
        frame.origin.x = frame.size.width * i;  
        UIView* view = [SongSelectViews objectAtIndex:i];
        view.frame = frame;
        [songScrollView addSubview:view];
    }
    
    
    CGSize scrollSize = songScrollView.frame.size;
    scrollSize.width *= [SongSelectViews count];
    [songScrollView setContentSize:scrollSize];
    frame.size.width = songScrollView.frame.size.width - 20;
    
    //Handle Score Image
        
      
    [self addSubview:songScrollView];
    [self addSubview:section_title];
    [self addSubview:scoreView];

    

    
    

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  
    // NSLog(@"sdfsf");
}


-(IBAction)buttonTrigger:(id)sender{
    
    UIButton *theButton = (UIButton *)sender;
    NSString * buttonTitle = theButton.currentTitle;
    
    [theButton setHighlighted:YES];
    
    if( ![buttonTitle isEqualToString:@"Play"] &&![buttonTitle isEqualToString:@"Learn"]&&![buttonTitle isEqualToString:@"Stop"] )
        selected_song = buttonTitle;

    if([buttonTitle isEqualToString:@"Play"]){
        
        Boolean * isPlaying;
        
        MusicPlayerIsPlaying(midi_player, isPlaying);
        
        if(((long int)isPlaying)>0){
            
            [self performSelectorInBackground:@selector(stopSongInBackground) withObject:nil];
            [self performSelectorInBackground:@selector(playMidiInBackground) withObject:nil];
        }
        else {
            [self performSelectorInBackground:@selector(playMidiInBackground) withObject:nil];
        }
        NSLog(@"%ld", (long int)isPlaying);
        
    
        
    }

    
    if([buttonTitle isEqualToString:@"Learn"]){
        
        if([selected_song isEqualToString:@"  Mary Had A little lamb"] ){
         [scoreView change_score:1];
            NSLog(@"One");


        }
        
        if([selected_song isEqualToString:@"    As Time Goes By"] ){
            [scoreView change_score:2];
            NSLog(@"Clicked");

        }
        
        if([selected_song isEqualToString:@"Flight Of The Bumble Bee"] )
            [scoreView change_score:3];

        
        if([selected_song isEqualToString:@"Carolina In The Morning"] )
            [scoreView change_score:4];

        
        if([selected_song isEqualToString:@" Alley Cat"] )
            [scoreView change_score:5];


        
    }
    
    if([buttonTitle isEqualToString:@"Stop"]){
        
        [self performSelectorInBackground:@selector(stopSongInBackground) withObject:nil];
    }
    
   
}

-(void) playMidiInBackground {
    
    // Create a new music sequence
    // Initialise the music sequence
    NewMusicSequence(&midi_Loader);
    
    // Get a string to the path of the MIDI file which
    // should be located in the Resources folder
    // I'm using a simple test midi file which is included in the download bundle at the end of this document
    
    
    NSString * filename;
    
    //Get the title
    
    /*
     self.songs = [[NSMutableArray alloc]
     initWithObjects:@"Mary Had A little Lamb", @"As Time Goes By",
     @"Flight Of The Bumble Bee", @"Carolina In The Morning",@"Alley Cat", nil];     
     */
  
    
    
    
    if([selected_song isEqualToString:@"  Mary Had A little lamb"] )
        filename = @"mary";
    
    if([selected_song isEqualToString:@"    As Time Goes By"] )
        filename = @"02astimegoesby";
    
    if([selected_song isEqualToString:@"Flight Of The Bumble Bee"] )
        filename = @"03bumbee";
    
    if([selected_song isEqualToString:@"Carolina In The Morning"] )
        filename = @"05carolina";
    
    if([selected_song isEqualToString:@" Alley Cat"] )
        filename = @"09alleycat";
    
    
    NSString *midiFilePath = [[NSBundle mainBundle]
                              pathForResource:filename
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
    //[self performSelectorOnMainThread:@selector(stopSongInBackground) withObject:nil waitUntilDone:TRUE];
    
    
    
    
    
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





@end
