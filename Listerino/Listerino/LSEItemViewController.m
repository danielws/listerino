//
//  LSEItemViewController.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEItemViewController.h"
#import "LSEButtonViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >>

@interface LSEItemViewController ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIView *locationView;
@property (nonatomic, strong) UIImageView *locationIconView;
@property (nonatomic, strong) UIImageView *chevronIconView;
@property (nonatomic,strong) UITextView *locationText;
@property (nonatomic, strong) UIView *noteView;
@property (nonatomic,strong) UITextView *noteText;
@property (nonatomic,strong) UIScrollView *noteScrollView;
@property (nonatomic, strong) UIColor *noteColor;
@property (nonatomic, strong) UIView *locationDivider;

@end

@implementation LSEItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    // set navigation bar's tint color when being shown
    self.navigationController.navigationBar.barTintColor = _noteColor;
    self.navigationController.navigationBar.barTintColor = _noteColor;
    
    LSEButtonViewController *buttonViewController = [LSEButtonViewController sharedInstance];
    [buttonViewController changeButtonTypeForViewController:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    //Note Color
    self.noteColor = [UIColor purpleColor];
    
    self.title = self.itemInfo.itemName;

    self.view.backgroundColor = self.noteColor;
    
    // Inits -------------------------------------------------------
    
    //Note scroll view
    self.noteScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self.view addSubview: self.noteScrollView];
    
    // Note Image
    UIImage *Image = [UIImage imageNamed:self.itemInfo.photo];
    self.imageView = [[UIImageView alloc] initWithImage:Image];
    [self.noteScrollView addSubview:self.imageView];
    
    // Location Label
    self.locationView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.noteScrollView addSubview:self.locationView];
    
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
    [self.noteScrollView addSubview:self.noteView];
    
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
    _imageView.frame = CGRectMake(0, 0, 320, 240);
    _imageView.backgroundColor = _noteColor;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // Location view layout
    _locationView.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame), 320, 50);
    _locationView.backgroundColor = [UIColor colorWithWhite:1 alpha:.1];
    
    _locationIconView.frame = CGRectMake(8-8, 8, _locationView.frame.size.height - 14, _locationView.frame.size.height-16);
    _locationIconView.contentMode = UIViewContentModeCenter;
//    _locationIconView.backgroundColor = [UIColor grayColor];
    
    _chevronIconView.frame = CGRectMake(CGRectGetWidth(_locationView.frame) - CGRectGetWidth(_locationIconView.frame)-8+7, 8, CGRectGetHeight(_locationIconView.frame), CGRectGetWidth(_locationIconView.frame));
    _chevronIconView.contentMode = UIViewContentModeCenter;
    
    _locationText.frame = CGRectMake(16 + (_locationView.frame.size.height - 16 - 13), 10, CGRectGetWidth(_locationView.frame) - 24 - (_locationIconView.frame.size.width)*2-8 +46, CGRectGetHeight(_locationView.frame)- 16);
    _locationText.backgroundColor = [UIColor clearColor];
    _locationText.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    _locationText.textColor = [UIColor whiteColor];

    _noteText.frame = CGRectMake(10, 10, 320 - 20, 300);
    _noteText.backgroundColor = _noteColor;
    _noteText.textColor = [UIColor whiteColor];
    _noteText.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    _noteText.userInteractionEnabled = NO;
    
    // Note view layout
    _noteView.frame = CGRectMake(0, CGRectGetMaxY(_locationView.frame), 320, CGRectGetHeight(_noteText.frame)+20);
    _noteView.backgroundColor = _noteColor;

    // Note scroll view Layout
    _noteScrollView.frame = CGRectMake(0, 0, 320, (CGRectGetHeight(_imageView.frame)+CGRectGetHeight(_locationView.frame)+CGRectGetHeight(_noteView.frame)));
    _noteScrollView.clipsToBounds = NO;
    _noteScrollView.contentSize=CGSizeMake(320,(CGRectGetHeight(_imageView.frame)+CGRectGetHeight(_locationView.frame)+CGRectGetHeight(_noteView.frame)));

}

@end
