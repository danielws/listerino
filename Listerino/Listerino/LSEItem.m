//
//  LSEItem.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEItem.h"

@implementation LSEItem


// Step 2: Create the item objects from the dictionary and put them in an array
+ (NSMutableArray *)itemArray:(NSMutableArray *)array {
    // init an empty Mutable array to hold all the item objects
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    // Pass the array of dictionaries into this loop that creates an LSE item object for each dictionary
    // and assigns properties based on the values in the dictionary
    for (NSDictionary *dictionary in array) {
        
        // Create a item object. Call our initwithDictionary method to assign properties for each one
        // based on the values of the current dictionary in the loop
        LSEItem *item = [[LSEItem alloc] initItemWithDictionary:dictionary];
        
        // Push newly created item object into the *items array
        [items addObject:item];
    }
    
    // Return the array of new item objects
    return items;
}

// Step 2 helper: create LSEitem objects from dictionary values
- (id)initItemWithDictionary:(NSDictionary *)dictionary {
    // This object is a new LSEList object. Create it
    self = [super init];
    
    // Make sure this doesn't return nil. That'd be bad.
    if (self) {
        
        // Set all our item properties from the values of the dictionary that was passed in
        self.itemName = dictionary[@"name"];
        self.photo = dictionary[@"photo"];
        self.itemLocation = dictionary[@"location"];
        self.itemNotes = dictionary[@"notes"];
    }
    
    // Return the LSEList object
    return self;
}


@end
