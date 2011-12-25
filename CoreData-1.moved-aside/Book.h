//
//  Book.h
//  CoreData
//
//  Created by Xubing Zhang on 11-12-25.
//  Copyright 2011 Ad-Sage. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Author;

@interface Book :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * Title;
@property (nonatomic, retain) Author * WrottenBy;

@end



