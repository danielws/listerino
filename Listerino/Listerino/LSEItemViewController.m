//
//  LSEItemViewController.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEItemViewController.h"

@interface LSEItemViewController ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIView *locationView;
@property (nonatomic, strong) UIImageView *locationIconView;
@property (nonatomic, strong) UIImageView *chevronIconView;
@property (nonatomic,strong) UITextView *locationText;
@property (nonatomic, strong) UIView *noteView;
@property (nonatomic,strong) UITextView *noteText;

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
    
    self.title = self.itemInfo.itemName;

    self.view.backgroundColor = [UIColor whiteColor];
    
    // Inits -------------------------------------------------------
    // Note Image
    UIImage *Image = [UIImage imageNamed:self.itemInfo.photo];
    self.imageView = [[UIImageView alloc] initWithImage:Image];
    [self.view addSubview:self.imageView];
    
    // Location Label
    self.locationView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.locationView];
    
    // Location Icon
    UIImage *locationIcon = [UIImage imageNamed:@"location.png"];
    self.locationIconView = [[UIImageView alloc] initWithImage:locationIcon];
    [self.locationView addSubview:self.locationIconView];
    
    // Chevron Icon
    UIImage *chevronIcon = [UIImage imageNamed:@"chevron.png"];
    self.chevronIconView = [[UIImageView alloc] initWithImage:chevronIcon];
    [self.locationView addSubview:self.chevronIconView];
 
    // Location Text
    self.locationText = [[UITextView alloc] initWithFrame:CGRectZero];
    self.locationText.editable = NO;
    self.locationText.text = self.itemInfo.itemLocation;
    [self.locationView addSubview:self.locationText];
    
    // Note Text
    self.noteView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.noteView addSubview:self.noteText];
    [self.view addSubview:self.noteView];
    
    self.noteText = [[UITextView alloc] initWithFrame:CGRectZero];
    self.noteText.text = self.itemInfo.itemNotes;
    [self.noteView addSubview:self.noteText];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - View layout
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Image view layout
    _imageView.frame = CGRectMake(0, 62, 320, 240);
    _imageView.backgroundColor = [UIColor greenColor];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // Location view layout
    _locationView.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame), 320, 50);
//    _locationView.backgroundColor = [UIColor redColor];
    
    _locationIconView.frame = CGRectMake(8-13, 8, _locationView.frame.size.height - 14, _locationView.frame.size.height-16);
    _locationIconView.contentMode = UIViewContentModeCenter;
//    _locationIconView.backgroundColor = [UIColor grayColor];
    
    _chevronIconView.frame = CGRectMake(CGRectGetWidth(_locationView.frame) - CGRectGetWidth(_locationIconView.frame)-8+17, 8, CGRectGetHeight(_locationIconView.frame), CGRectGetWidth(_locationIconView.frame));
    _chevronIconView.contentMode = UIViewContentModeCenter;
    
    _locationText.frame = CGRectMake(16 + (_locationView.frame.size.height - 16 - 13), 10, CGRectGetWidth(_locationView.frame) - 24 - (_locationIconView.frame.size.width)*2-8 +46, CGRectGetHeight(_locationView.frame)- 16);
//    _locationText.backgroundColor = [UIColor whiteColor];
    _locationText.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    _locationText.textColor = [UIColor colorWithRed:0.5725490196 green:0.5725490196 blue:0.5725490196 alpha:1];

    // Note view layout
    _noteView.frame = CGRectMake(0, CGRectGetMaxY(_locationView.frame), 320, 500);
//    _noteView.backgroundColor = [UIColor yellowColor];
    
    _noteText.frame = CGRectMake(5, 5, CGRectGetWidth(_noteView.frame) - 10, 100);
//    _noteText.backgroundColor = [UIColor brownColor];
    _noteText.textColor = [UIColor blackColor];
    _noteText.font = [UIFont fontWithName:@"HelveticaNeue" size:18];

    



}

@end
