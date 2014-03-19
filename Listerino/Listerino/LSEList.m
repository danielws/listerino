//
//  LSEList.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEList.h"
#import "LSEItem.h"

@implementation LSEList

- (id)init
{
    self = [super init];
    
    self.listItems = [[NSMutableArray alloc] init];
    
    return self;
}

// Step 2 helper: create LSEList objects from dictionary values
- (id)initListWithDictionary:(NSDictionary *)dictionary {
    // This object is a new LSEList object. Create it
    self = [super init];
    
    // Make sure this doesn't return nil. That'd be bad.
    if (self) {
        
        // Set all our item properties from the values of the dictionary that was passed in
        self.listName = dictionary[@"name"];
        self.listItems = [LSEItem itemArray:dictionary[@"items"]];
        self.listContributors = dictionary[@"contributors"];
    }
    
    // Return the LSEList object
    return self;
}


// Step 2: Create the list objects from the dictionary and put them in an array
+ (NSMutableArray *)listArray:(NSArray *)array {
    // init an empty Mutable array to hold all the list objects
    NSMutableArray *lists = [[NSMutableArray alloc] init];
    
    // Pass the array of dictionaries into this loop that creates an LSE list object for each dictionary
    // and assigns properties based on the values in the dictionary
    for (NSDictionary *dictionary in array) {
        
        // Create a list object. Call our initwithDictionary method to assign properties for each one
        // based on the values of the current dictionary in the loop
        LSEList *list = [[LSEList alloc] initListWithDictionary:dictionary];
        
        // Push newly created list object into the lists array
        [lists addObject:list];
    }
    
    // Return the array of new list objects
    return lists;
}


// Step 1: Create the array of dictionaries and pass the aaray into the listArrary method

+ (NSArray *)fakeLists {
    NSArray *contributors = [[NSArray alloc] init];
    
    NSArray *dictionaries =
    @[
      @{@"name" : @"Restaurants",
        @"items" : @[
                @{@"name" : @"In and out burger",
                  @"photo" : @"In-N-Out-Burger_Sign_San_Francisco@2x.jpg",
                  @"location" : @"333 Jefferson St San Francisco, CA",
                  @"notes" : @"There's something about In-N-Out that makes me crave it whenever I need a late night snack/meal and now that I think about it, it's my go to place for that situation! In-N-Outs menu is very simple offering a hamburger, cheeseburger, or a double cheeseburger. It's quite cheap too but the quality is very very good and I prefer eating these burgers than restaurant burgers by far. The nice toasted bun and tasty ingredients are to crave for! Despite the misleading limited menu, there's actually a lot of customizations here you can do and my favorite is:"
                  },
                
                @{@"name" : @"Arbys",
                  @"photo" : [[UIImage alloc] init],
                  @"location" : @"Who knows",
                  @"notes" : @"Roast beef sandwich"
                  },
                
                @{@"name" : @"Taco Bell",
                  @"photo" : [[UIImage alloc] init],
                  @"location" : @"Geary st",
                  @"notes" : @"Dorito taco is a good deal"
                  }
                ],
        @"contributors" : contributors
        },
      
      @{@"name" : @"Cool spots",
        @"items" : @[
                @{@"name" : @"Corona Heights",
                  @"photo" : [[UIImage alloc] init],
                  @"location" : @"Above Beuna Vista Park",
                  @"notes" : @"Check it out at sunrise"
                  },
                
                @{@"name" : @"De Young Observation Tower",
                  @"photo" : [[UIImage alloc] init],
                  @"location" : @"Golden Gate Park",
                  @"notes" : @"Pretty cool view"
                  },
                
                @{@"name" : @"Ocean Beach",
                  @"photo" : [[UIImage alloc] init],
                  @"location" : @"Ocean Beach",
                  @"notes" : @"The water is cold and it's really windy"
                  }
                ],
        @"contributors" : contributors
        },
      
      @{@"name" : @"Books",
        @"items" : @[
                @{@"name" : @"Crime and Punishment",
                  @"photo" : [[UIImage alloc] init],
                  @"location" : @"Russia",
                  @"notes" : @"Russian books are depressing"
                  },
                
                @{@"name" : @"Objective C for dummies",
                  @"photo" : [[UIImage alloc] init],
                  @"location" : @"Barnes and Noble",
                  @"notes" : @"What's an objective c?"
                  }
                ],
        @"contributors" : contributors
        }
    ];
    
    return  [LSEList listArray:dictionaries];
}






@end
