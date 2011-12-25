//
//  Author.h
//  CoreData
//
//  Created by Xubing Zhang on 11-12-25.
//  Copyright 2011 Ad-Sage. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Book;

@interface Author :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * Name;
@property (nonatomic, retain) NSSet* Write;

@end


@interface Author (CoreDataGeneratedAccessors)
- (void)addWriteObject:(Book *)value;
- (void)removeWriteObject:(Book *)value;
- (void)addWrite:(NSSet *)value;
- (void)removeWrite:(NSSet *)value;

@end

