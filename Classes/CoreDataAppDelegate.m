//
//  CoreDataAppDelegate.m
//  CoreData
//
//  Created by Xubing Zhang on 11-12-24.
//  Copyright 2011 Ad-Sage. All rights reserved.
//

#import "CoreDataAppDelegate.h"
#import "CoreDataViewController.h"
#import"Book.h"
#import"Author.h"
@implementation CoreDataAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize managedObjectContenxt;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

		//test TestArrayToPlist
		//[self TestArrayToPlist];
	
		//test the coredata
	
	[self managedObjectContenxt];
	[self demo];
	
    // Add the view controller's view to the window and display.
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

-(void)TestArrayToPlist
{
	NSString *rootDic = NSOpenStepRootDirectory();
	NSLog(@"NSOpenStepRootDirectory:%@",rootDic);

	NSString *userName = NSFullUserName();
	NSLog(@"NSFullUserName:%@",userName);
	
	NSString *tmp =NSTemporaryDirectory();
	NSLog(@"tmp:%@",tmp);
  
	NSString * homePath =NSHomeDirectory();
	NSLog(@"homePath:%@",homePath);

	NSArray * paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docPath =[paths objectAtIndex:0];
	NSLog(@"DocPath%@",docPath);
	
	
	NSString *filename =[docPath stringByAppendingPathComponent:@"array.plist"];
	NSLog(@"filepath:%@",filename);
	NSArray *array =[[NSArray alloc] initWithObjects:@"Text String",
					 [[NSNumber alloc] initWithInt:1],
					 [[NSNumber alloc] initWithBool:YES],
					 [NSDate dateWithTimeIntervalSinceNow:60],
					 nil];
	[array writeToFile:filename atomically:YES];
}

-(void)TestDirectoryToPlist
{
	
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

#pragma mark override the method for managedObjectContenxt getter
-(NSManagedObjectContext*)managedObjectContenxt
{
	if (managedObjectContenxt ==nil) {
		NSArray * paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *path =[paths objectAtIndex:0];
		NSURL *url =[NSURL fileURLWithPath:[path stringByAppendingPathComponent:@"books.sqlite"]];
		NSError *err;
		NSPersistentStoreCoordinator *persistentStroeCoordinator =
		[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:
		 [NSManagedObjectModel mergedModelFromBundles:nil]];
		
		if (![persistentStroeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil 
															   URL:url options:nil error:&err]) {
			NSLog(@"failed to add peristent store");
		}
		
		managedObjectContenxt =[[NSManagedObjectContext alloc] init];
		[managedObjectContenxt setPersistentStoreCoordinator:persistentStroeCoordinator];
	}
	return managedObjectContenxt;
}

-(void)demo
{
		//对象的名称是大小写敏感的。如果用book，会导致错误。
	Book *book1 = (Book*)[NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.managedObjectContenxt];
	Book *book2 = (Book*)[NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.managedObjectContenxt];
	
	Author *author1 = (Author*)[NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:self.managedObjectContenxt];
	Author *author2 = (Author*)[NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:self.managedObjectContenxt];

	book1.Title=@"iPhone";
	author1.Name =@"iPhoneDev";
	
	book2.Title =@"android";
	author2.Name =@"xubing";
	
	[author1 addWriteObject:book1];
	[author2 addWriteObject:book1];
	[author2 addWriteObject:book2];
	
	NSArray * booksAuthor2Wrote= [author2.Write allObjects];
	for (int i=0; i<[booksAuthor2Wrote count]; ++i) {
	    Book *tempbook =(Book*)[booksAuthor2Wrote objectAtIndex:i];
		NSLog(@"Book %@ write include:%@",author2.Name,tempbook.Title);
		
	}
	
	
	NSArray * booksAuthor1Wrote= [author1.Write allObjects];
	for (int i=0; i<[booksAuthor1Wrote count]; ++i) {
	    Book *tempbook =(Book*)[booksAuthor1Wrote objectAtIndex:i];
		NSLog(@"Book %@ write include:%@",author1.Name,tempbook.Title);
		
	}
	

}

@end
