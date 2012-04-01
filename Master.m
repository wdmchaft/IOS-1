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
    left = [[LeftView alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:left];
    right = [[RightView alloc] initWithNibName:@"RightView" bundle:nil];
    UINavigationController *rightNav = [[UINavigationController alloc] initWithRootViewController:right];
    left.right = right;
    
    splitViewController = [[UISplitViewController alloc] init];
    splitViewController.viewControllers = [NSArray arrayWithObjects:leftNav,rightNav, nil];
    splitViewController.delegate = right;
    self.view = splitViewController.view;
}

- (BOOL)splitViewController: (UISplitViewController*)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
{
    return NO;
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
