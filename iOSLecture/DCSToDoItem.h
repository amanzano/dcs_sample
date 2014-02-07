//
//  DCSToDoItem.h
//  iOSLecture
//
//  Created by Audrey Manzano on 2/6/14.
//  Copyright (c) 2014 Audrey Manzano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCSToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
