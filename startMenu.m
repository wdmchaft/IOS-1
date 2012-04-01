//
//  startMenu.m
//  Instrument
//
//  Created by Louis Ellis on 3/31/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "startMenu.h"
#import "Register.h"

@interface startMenu ()

@end

@implementation startMenu
@synthesize register_menu;
@synthesize start_app;
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
}

-(IBAction)buttonTrigger:(id)sender{
    UIButton *theButton = (UIButton *)sender;
    NSString * buttonTitle = theButton.currentTitle;
    
    if([buttonTitle isEqualToString:@"Register"]){

        if(self.register_menu == nil)
        {
            Register *register_menu = [[Register alloc]
                                          initWithNibName:@"Register" bundle:[NSBundle mainBundle]];
            self.register_menu = register_menu;
        }
        
        
        [self.navigationController pushViewController:self.register_menu animated:YES];
    }
    
    if([buttonTitle isEqualToString:@"Hello"]){
        NSLog(@"Hello");
        
        if(self.start_app == nil)
        {
            Master *start_app = [[Master alloc]
                                       initWithNibName:@"Master" bundle:[NSBundle mainBundle]];
            self.start_app = start_app;
        }
        
        
        [self.navigationController pushViewController:self.start_app animated:YES];
    
    }
    
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
