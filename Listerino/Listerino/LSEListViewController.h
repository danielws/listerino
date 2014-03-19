//
//  LSEListViewController.h
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSEList.h"

@interface LSEListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LSEList *listInfo;

@end
