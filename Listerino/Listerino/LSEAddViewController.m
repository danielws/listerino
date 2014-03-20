//
//  LSEAddViewController.m
//  Listerino
//
//  Created by Ben Langholz on 3/19/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEAddViewController.h"

@interface LSEAddViewController ()
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIButton *cameraButton;
@property (nonatomic,strong) UIButton *cameraRollButton;
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

@implementation LSEAddViewController

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

    self.view.backgroundColor = [UIColor redColor];

    //Note Color
    self.noteColor = [UIColor redColor];
        
    self.view.backgroundColor = self.noteColor;
    
    // Inits -------------------------------------------------------
    
    //Note scroll view
    self.noteScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self.view addSubview: self.noteScrollView];
    
    // Note Image
    self.imageView = [[UIImageView alloc] initWithImage:nil];
    [self.noteScrollView addSubview:self.imageView];
    
    //Camera Button
    self.cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview: self.cameraButton];

    //Camera Button
    self.cameraRollButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview: self.cameraRollButton];
    
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
    self.locationText.text = @"location";
    [self.locationView addSubview:self.locationText];
    
    // Note Text
    self.noteView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.noteView addSubview:self.noteText];
    [self.noteScrollView addSubview:self.noteView];
    
    self.noteText = [[UITextView alloc] initWithFrame:CGRectZero];
    self.noteText.text = @"Note";
    [self.noteView addSubview:self.noteText];

    
    self.doneButton = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 80) / 2, CGRectGetMaxY(self.view.frame) - 100, 80, 80)];
    UIImage *addButtonImage = [UIImage imageNamed:@"doneButton.png"];
    [self.doneButton setBackgroundImage:addButtonImage forState:UIControlStateNormal];
    [self.doneButton addTarget:self action:@selector(onAddButtonDown:) forControlEvents:UIControlEventTouchDown];
    [self.doneButton addTarget:self action:@selector(onAddButtonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.doneButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - View layout
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Image view layout
    _imageView.frame = CGRectMake(0, 0, 320, 240);
    _imageView.backgroundColor = _noteColor;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    //Camera Button Layout
    [_cameraButton setTitle:@"Take Photo" forState:UIControlStateNormal];
    _cameraButton.frame = CGRectMake(0, 0, 320, 100);
    [_cameraButton addTarget:self action:@selector(onCameraButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //Camera Roll Layout
    [_cameraRollButton setTitle:@"Choose Photo" forState:UIControlStateNormal];
    _cameraRollButton.frame = CGRectMake(0, 100, 320, 100);
    [_cameraRollButton addTarget:self action:@selector(onCameraRollButton:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    // Note view layout
    _noteView.frame = CGRectMake(0, CGRectGetMaxY(_locationView.frame), 320, CGRectGetHeight(_noteText.frame)+20);
    _noteView.backgroundColor = _noteColor;
    
    // Note scroll view Layout
    _noteScrollView.frame = CGRectMake(0, 0, 320, (CGRectGetHeight(_imageView.frame)+CGRectGetHeight(_locationView.frame)+CGRectGetHeight(_noteView.frame)));
    _noteScrollView.clipsToBounds = NO;
    _noteScrollView.contentSize=CGSizeMake(320,(CGRectGetHeight(_imageView.frame)+CGRectGetHeight(_locationView.frame)+CGRectGetHeight(_noteView.frame)));
    
}

- (void)onAddButtonUp:(id)sender {
    NSLog(@"Button Up");
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.doneButton.frame = CGRectMake((self.view.frame.size.width - 80) / 2, CGRectGetMaxY(self.view.frame) - 100, 80, 80);
        [self dismissViewControllerAnimated:YES completion:nil];
    } completion:^(BOOL finished) {
        //
    }];
}

- (void)onAddButtonDown:(id)sender {
    NSLog(@"Button Down");
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.doneButton.frame = CGRectMake(self.doneButton.frame.origin.x+10, self.doneButton.frame.origin.y+10
                                          , self.doneButton.frame.size.width-20, self.doneButton.frame.size.height-20);
    } completion:^(BOOL finished) {
        //
    }];
}

- (void)onCameraButton:(id)sender {
    NSLog(@"Take photo!");
}

- (void)onCameraRollButton:(id)sender {
    NSLog(@"Choose photo!");
}

@end
