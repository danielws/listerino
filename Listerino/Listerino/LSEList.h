//
//  LSEList.h
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSEList : NSObject
@property (nonatomic, copy) NSString *listName;
@property (nonatomic, strong) NSMutableArray *listItems;
@property (nonatomic, strong) NSMutableArray *listContributors;
@property (nonatomic, strong) id listColor;
@property (nonatomic, assign) BOOL isEditing;

+ (NSArray *)fakeLists;

@end
