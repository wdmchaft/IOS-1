//
//  startMenu.m
//  Instrument
//
//  Created by Louis Ellis on 3/31/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "startMenu.h"
#import "Register.h"
#import "CoreDataAccess.h"
#import "mobilesynthViewController.h"


@interface startMenu ()

@end

@implementation startMenu
@synthesize register_menu;
@synthesize start_app;
@synthesize user_table;
@synthesize users;
@synthesize learn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CoreDataAccess * table_contents = [[CoreDataAccess alloc]init];
    NSMutableArray *contents = [table_contents core_data_Content];
    self.title= @"Instrument Apprentice: Piano";
    users = [[NSMutableArray alloc]init];

    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"start_bg.png"]];
   
    contents = [contents valueForKey:@"user_id"];
    self.users= contents;

    //user_table.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [user_table setBackgroundColor:[UIColor blackColor]];
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(self.learn == nil)
    {
        mobilesynthViewController *start_app = [[mobilesynthViewController alloc]
                                                initWithNibName:@"mobilesynthViewController" bundle:[NSBundle mainBundle]];
        self.learn = start_app;
    }
    
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController pushViewController:learn animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
	//self.navigationController.navigationBar.barStyle = UIBarStyleBlack; 	
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Required for UITableViewDataSource protocol: informs table view of how many rows to be loaded in each section
    return [self.users count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Required for UITableViewDataSource protocol: Responsible for returning instances of the UITableViewCell class
    static NSString *CellIdentifier = @"Cell";
    

    //---try to get a reusable cell---
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    //---create new cell if no reusable cell is available---
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] init] ;
        
    }
    

    //---set the text to display for the cell---
  //  [contents valueForKey:@"user_id"];
    NSString *cellValue = [users objectAtIndex:indexPath.row] ;
    
    cell.textLabel.text = cellValue;

    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
        return @"Profiles";
   
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
