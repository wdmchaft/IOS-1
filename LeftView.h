//
//  LeftView.h
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RightView.h"

@interface LeftView : UITableViewController{
    	    NSMutableArray *songs;
            NSMutableArray *songContent;

    	    IBOutlet RightView *right;
    	 
    	}
@property(nonatomic, retain) IBOutlet RightView *right;
@property(nonatomic, retain) NSMutableArray *songs;
@property(nonatomic, retain) NSMutableArray *songContent;

@end
