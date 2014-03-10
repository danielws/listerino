//
//  LSEItemViewController.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEItemViewController.h"

@interface LSEItemViewController ()

@end

@implementation LSEItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"List Item";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //Note Image
    UIImage *noteImage = [UIImage imageNamed:@"..."];
    UIImageView *noteImageView = [[UIImageView alloc] initWithImage:noteImage];
    noteImageView.backgroundColor = [UIColor greenColor];
    noteImageView.frame = CGRectMake(0, 62, 320, 240);
    [self.view addSubview:noteImageView];
    
    //Location
    UIView *locationView = [[UIView alloc] initWithFrame:CGRectMake(0, noteImageView.frame.origin.y+noteImageView.frame.size.height+0, 320, 50)];
    locationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:locationView];
    
    UIImage *locationIcon = [UIImage imageNamed:@".."];
    UIImageView *locationIconView = [[UIImageView alloc] initWithImage:locationIcon];
    locationIconView.backgroundColor = [UIColor grayColor];
    locationIconView.frame = CGRectMake(8, 8, locationView.frame.size.height-16, locationView.frame.size.height-16);
    [locationView addSubview:locationIconView];
    
    UITextView *locationText = [[UITextView alloc] initWithFrame:CGRectMake(8, 8, locationView.frame.size.height-16, 100)];
    locationText.backgroundColor = [UIColor clearColor];
    //    locationText.attributedText = @"Loaction!";
    locationText.textColor = [UIColor blackColor];
    locationText.editable = NO;
    [locationView addSubview:locationText];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
