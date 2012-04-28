//
//  MasterController.h
//  Instrument
//
//  Created by Louis Ellis on 4/27/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@class DetailViewController;
@class MGSplitViewController;


@interface MasterController : UIViewController{
    UIWindow *window;
    MGSplitViewController *splitViewController;
    RootViewController *rootViewController;
    DetailViewController *detailViewController;

    
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MGSplitViewController *splitViewController;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;



@end
