//
//  Users.h
//  Instrument
//
//  Created by Louis Ellis on 3/30/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Users : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * user_id;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSString * email;

@end
