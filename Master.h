//
//  Master.h
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeftView;
@class RightView;
@interface Master : UIViewController

	{
    	    LeftView *left;
    	    RightView *right;
    	    UISplitViewController *splitViewController;
    	 
    	}
	 
	@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
	@property (nonatomic, retain) IBOutlet LeftView *left;
	@property (nonatomic, retain) IBOutlet RightView *right;
	 
@end
