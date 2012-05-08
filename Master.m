//
//  Master.m
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "Master.h"
#import "LeftView.h"
#import "RightView.h"



@interface Master ()

@end

@implementation Master
@synthesize left;
@synthesize right;
@synthesize splitViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //    [appDelegate showProgressHUD:@"Loading"];
    // Do any additional setup after loading the view from its nib.
  

    
   // self.view = self.tabBarController;

   
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
