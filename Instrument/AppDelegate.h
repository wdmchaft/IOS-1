//
//  AppDelegate.h
//  Instrument
//
//  Created by Louis Ellis on 3/26/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
  IBOutlet UINavigationController *navigationController;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;


// Core data stuff
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext; // "Bridge" or connection between your code and the data store

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel; // Contains your schema; contains methods for deleting/adding data to data store

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator; // "Bridge" or connection between your application and physical files
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;


-(BOOL) userPresent;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
