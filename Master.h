//
//  Master.h
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterDetailSplitController;
@class ColorListMasterController;
@class APSplitViewController;
@interface Master : UIViewController

	{
    	    ColorListMasterController *left;
    	    MasterDetailSplitController *right;
    	    APSplitViewController *splitViewController;
    	 
    	}

	@property (nonatomic, retain) IBOutlet APSplitViewController *splitViewController;
	@property (nonatomic, retain) IBOutlet ColorListMasterController *left;
	@property (nonatomic, retain) IBOutlet MasterDetailSplitController *right;
	 
@end
