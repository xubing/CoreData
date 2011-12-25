//
//  CoreDataAppDelegate.h
//  CoreData
//
//  Created by Xubing Zhang on 11-12-24.
//  Copyright 2011 Ad-Sage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<CoreData/CoreData.h>
@class CoreDataViewController;

@interface CoreDataAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreDataViewController *viewController;
	NSManagedObjectContext *managedObjectContenxt;
}

#pragma mark valiable	
@property (nonatomic,retain)	NSManagedObjectContext *managedObjectContenxt;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoreDataViewController *viewController;

#pragma mark method
-(void)TestArrayToPlist;

@end

