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


@interface startMenu ()

@end

@implementation startMenu
@synthesize register_menu;
@synthesize start_app;
@synthesize user_table;
@synthesize users;
@synthesize con;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        user_table.backgroundColor = [UIColor colorWithRed:0. green:0.39 blue:0.106 alpha:.2];
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

    user_table.backgroundColor = [UIColor clearColor];
    
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  //  start_app =   [[Master alloc] initWithNibName:@"Master" bundle:[NSBundle mainBundle]];
   con  =   [[MasterController alloc] init];
    
   // MGSplitViewController * start_app 
  //  self.splitViewController = [[MGSplitViewController alloc] init];
    [self.navigationController pushViewController:self.con animated:YES];

}

- (void)viewWillAppear:(BOOL)animated
{
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack; // the part that doesn't work
	self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
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
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewStyleGrouped reuseIdentifier:CellIdentifier] ;
        
    }

    //---set the text to display for the cell---
  //  [contents valueForKey:@"user_id"];
    NSString *cellValue = [users objectAtIndex:indexPath.row] ;
    
    cell.textLabel.text = cellValue;
    cell.backgroundColor = [UIColor colorWithRed:0. green:0.39 blue:0.106 alpha:0.];

    
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
