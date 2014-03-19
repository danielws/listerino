//
//  LSEItem.h
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSEItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *itemLocation;
@property (nonatomic, copy) NSString *itemNotes;

+ (NSMutableArray *)itemArray:(NSMutableArray *)array;

@end
