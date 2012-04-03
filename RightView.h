//
//  RightView.h
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


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
@property (strong) AVAudioPlayer *mary_had;

@end
