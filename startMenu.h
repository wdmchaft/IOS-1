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


@class mobilesynthViewController;


@interface startMenu : UIViewController <UITableViewDataSource>
{
    Register *register_menu;
    Master * start_app;
    NSMutableArray *users;
    mobilesynthViewController * learn;
    UITableView *user_table;

}


-(IBAction)buttonTrigger:(id)sender;
@property (nonatomic, retain) Register *register_menu;
@property (nonatomic, retain) Master *start_app;
@property (nonatomic, retain)  mobilesynthViewController *learn;
@property (strong, nonatomic) UITableView *user_table;
@property (strong, nonatomic) NSMutableArray *users;



@end
