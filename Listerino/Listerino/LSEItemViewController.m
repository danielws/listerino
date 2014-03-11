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
    
    UIImage *locationChevron = [UIImage imageNamed:@".."];
    UIImageView *locationChevronView = [[UIImageView alloc] initWithImage:locationChevron];
    locationChevronView.backgroundColor = [UIColor grayColor];
    locationChevronView.frame = CGRectMake(0, 0, locationView.frame.size.height-16, locationView.frame.size.height-16);
    locationChevronView.frame = CGRectMake(locationView.frame.size.width-locationChevronView.frame.size.width-8, 8, locationChevronView.frame.size.width, locationChevronView.frame.size.height);
    [locationView addSubview:locationChevronView];
    
    UILabel *locationText = [[UILabel alloc] initWithFrame:CGRectMake(locationIconView.frame.origin.x+locationIconView.frame.size.width+8, 8, 200, locationView.frame.size.height-16)];
    locationText.backgroundColor = [UIColor clearColor];
    locationText.text = @"Location!";
    locationText.textColor = [UIColor blackColor];
    [locationView addSubview:locationText];
    
    UILabel *note = [[UILabel alloc] init];
    note.text = @"This is a very long placeholder I hope it wraps to 2 lines!a asd asd asd asdlkakj";
    note.frame = CGRectMake(0, locationView.frame.origin.y+locationView.frame.size.height+16, self.view.frame.size.width, self.view.frame.size.height);
    [note setNumberOfLines:0];
    [note sizeToFit];
    note.frame = CGRectMake(note.frame.origin.x+16, note.frame.origin.y, note.frame.size.width-32, note.frame.size.height);
//    note.textAlignment = UITextAlignmentLeft;
    [self.view addSubview:note];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
