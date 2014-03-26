//
//  LSEButtonViewController.m
//  Listerino
//
//  Created by Ben Langholz on 3/19/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEButtonViewController.h"

// Import The "real" root
#import "LSELibraryViewController.h"
#import "LSEAddViewController.h"
#import "LSEListViewController.h"
#import "LSEItemViewController.h"


@interface LSEButtonViewController ()
@property (nonatomic, strong) UIButton *addListButton;
@property (nonatomic, strong) UIButton *addItemButton;

@property (nonatomic,strong) UINavigationController *nav;
@property (nonatomic,strong) UIViewController *currentViewController;
@property (nonatomic,strong) LSELibraryViewController *libraryViewController;

@end

@implementation LSEButtonViewController

static LSEButtonViewController *sSharedInstance = nil;

+ (LSEButtonViewController *)sharedInstance
{
    if (!sSharedInstance) {
        sSharedInstance = [[LSEButtonViewController alloc]init];
    }
    return sSharedInstance;
}

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
    
    
    self.addListButton = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 80) / 2, CGRectGetMaxY(self.view.frame) - 100, 80, 80)];
    UIImage *addListButtonImage = [UIImage imageNamed:@"addButton.png"];
    [self.addListButton setBackgroundImage:addListButtonImage forState:UIControlStateNormal];
    [self.addListButton addTarget:self action:@selector(onAddListButtonDown:) forControlEvents:UIControlEventTouchDown];
    [self.addListButton addTarget:self action:@selector(onAddListButtonUp:) forControlEvents:UIControlEventTouchUpInside];

    
    self.addItemButton = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 80) / 2, CGRectGetMaxY(self.view.frame) - 100, 80, 80)];
    UIImage *addItemButtonImage = [UIImage imageNamed:@"addButton.png"];
    [self.addItemButton setBackgroundImage:addItemButtonImage forState:UIControlStateNormal];
    [self.addItemButton addTarget:self action:@selector(onAddItemButtonDown:) forControlEvents:UIControlEventTouchDown];
    [self.addItemButton addTarget:self action:@selector(onAddItemButtonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupRootViewController];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Call once after the view has been set up (either through nib or coded).
- (void)setupRootViewController
{
    // Instantiate what will become the new root
    LSELibraryViewController *root = [[LSELibraryViewController alloc] init];
    self.libraryViewController = root;
    
    // Create the Navigation Controller
    self.nav = [[UINavigationController alloc] initWithRootViewController:root];
    
    // Add its view beneath all ours (including the button we made)
    [self addChildViewController:self.nav];
    [self.view insertSubview:self.nav.view atIndex:0];
    [self.nav didMoveToParentViewController:self];
}

- (void)changeButtonTypeForViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[LSELibraryViewController class]])
    {
        NSLog(@"library view");
        [self.addItemButton removeFromSuperview];
        self.currentViewController = viewController;
        [self.view addSubview:self.addListButton];

    }
    
    else if ([viewController isKindOfClass:[LSEListViewController class]])
    {
        NSLog(@"list view");
        [self.addListButton removeFromSuperview];
        [self.view addSubview:self.addItemButton];
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.addItemButton.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            //
        }];
        self.currentViewController = viewController;
         }
    
    else if ([viewController isKindOfClass:[LSEItemViewController class]])
    {
        NSLog(@"item view");
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            self.addItemButton.frame = CGRectMake((self.view.frame.size.width - 80) / 2, CGRectGetMaxY(self.view.frame) - 100 + 200, 80, 80);
//            self.addItemButton.transform = CGAffineTransformMakeRotation(M_PI_4*3);
            self.addItemButton.transform = CGAffineTransformMakeTranslation(0, 100);

        } completion:^(BOOL finished) {
            [self.addItemButton removeFromSuperview];
            self.currentViewController = viewController;
        }];
    }
}

- (void)onAddItemButtonUp:(id)sender {
    
    NSLog(@"Button Up");
    
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{

        self.addItemButton.transform = CGAffineTransformMakeScale(1, 1);
        
        UIViewController *vc = [[LSEAddViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
        // vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // Fade
        // vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal; // Flip
        // vc.modalTransitionStyle = UIModalTransitionStylePartialCurl; // Curl
        
        [self presentViewController:vc animated:YES completion:nil];
    } completion:^(BOOL finished) {
        //
    }];
}

- (void)onAddListButtonUp:(id)sender {
    
    NSLog(@"Button Up");
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.addListButton.transform = CGAffineTransformMakeScale(1, 1);
        
        [self.libraryViewController editableCell];
    } completion:^(BOOL finished) {
        //
    }];
    
    
}

- (void)onAddItemButtonDown:(id)sender {
    
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{

        self.addItemButton.transform = CGAffineTransformMakeScale(0.8, 0.8);

    } completion:^(BOOL finished) {
        //
    }];
}

- (void)onAddListButtonDown:(id)sender {

    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^{

        self.addListButton.transform = CGAffineTransformMakeScale(0.8, 0.8);

    } completion:^(BOOL finished) {
       //
    }];
}


@end
