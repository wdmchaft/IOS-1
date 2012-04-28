//
//  MasterController.m
//  Instrument
//
//  Created by Louis Ellis on 4/27/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "MasterController.h"
#import "RootViewController.h"
#import "DetailViewController.h"
#import "MGSplitViewController.h"

@interface MasterController ()

@end

@implementation MasterController
@synthesize window, splitViewController, rootViewController, detailViewController;

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
	// Do any additional setup after loading the view.

    [rootViewController performSelector:@selector(selectFirstRow) withObject:nil afterDelay:0];
	[detailViewController performSelector:@selector(configureView) withObject:nil afterDelay:0];

    
    splitViewController = [[MGSplitViewController alloc]init];
    
    rootViewController = [[RootViewController alloc] init];
    UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    detailViewController = [[DetailViewController alloc] init];
    UINavigationController *rightNav = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    rootViewController.detailViewController = detailViewController;

	
	if (NO) { // whether to allow dragging the divider to move the split.
		splitViewController.splitWidth = 15.0; // make it wide enough to actually drag!
		splitViewController.allowsDraggingDivider = YES;
	}
    
    splitViewController.viewControllers = [NSArray arrayWithObjects:leftNav,rightNav, nil];

    
	
	
	self.view= splitViewController.view;
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
