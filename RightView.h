//
//  RightView.h
//  Instrument
//
//  Created by Louis Ellis on 4/1/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightView : UIViewController
{
    IBOutlet UILabel *lbltitle;
    NSDictionary *newsdetail;
}

@property (retain, nonatomic) NSNumber *detailItem;
@property (nonatomic,retain)NSDictionary *newsDict;
@end
