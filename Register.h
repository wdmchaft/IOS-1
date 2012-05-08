//
//  Register.h
//  Instrument
//
//  Created by Louis Ellis on 3/28/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Register : UIViewController
{


}

-(IBAction)buttonTrigger:(id)sender;
-(bool) save;
@property (nonatomic, retain) IBOutlet UITextField *username_field;
@property (nonatomic, retain) IBOutlet UITextField *name_field;
@property (nonatomic, retain) IBOutlet UITextField *email_field;


// Core data stuff
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext; // "Bridge" or connection between your code and the data store

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel; // Contains your schema; contains methods for deleting/adding data to data store

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator; // "Bridge" or connection between your application and physical files

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
