//
//  LSEButtonViewController.h
//  Listerino
//
//  Created by Ben Langholz on 3/19/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSEButtonViewController : UIViewController
- (void)changeButtonTypeForViewController:(UIViewController *)viewController;
// Singleton accessor. Returns the one instance of the class
+ (LSEButtonViewController *)sharedInstance;
@end
