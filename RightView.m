//
//  RightView.m
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "RightView.h"
#import "LeftView.h"
@interface RightView ()

@end

@implementation RightView
@synthesize newsDict;
@synthesize detailItem;
@synthesize navigationBar;
@synthesize mary_had;
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
-(IBAction)buttonTrigger:(id)sender{
    UIButton *theButton = (UIButton *)sender;
    NSString * buttonTitle = theButton.currentTitle;
    
    if([buttonTitle isEqualToString:@"Play Song"]){
        if (mary_had != nil) {
            [mary_had play];
            NSLog(@"gffg");
        }
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

    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/mary.mid", [[NSBundle mainBundle] resourcePath]]];        
    mary_had= [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&audioError];
    
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
