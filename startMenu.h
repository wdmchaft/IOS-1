//
//  startMenu.h
//  Instrument
//
//  Created by Louis Ellis on 3/31/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Register.h"
#import "Master.h"
#import "MasterController.h"



@interface startMenu : UIViewController <UITableViewDataSource>
{
    Register *register_menu;
    Master * start_app;
    NSMutableArray *users;
    MasterController * con;

}


-(IBAction)buttonTrigger:(id)sender;
@property (nonatomic, retain) Register *register_menu;
@property (nonatomic, retain) Master *start_app;
@property (nonatomic, retain) MasterController *con;

@property (strong, nonatomic) UITableView *user_table;
@property (strong, nonatomic) NSMutableArray *users;



@end
