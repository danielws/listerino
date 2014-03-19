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

@interface LSEButtonViewController ()
@property (nonatomic, strong) UIButton *addButton;


@end

@implementation LSEButtonViewController

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
    
    self.addButton = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 80) / 2, CGRectGetMaxY(self.view.frame) - 100, 80, 80)];
    UIImage *addButtonImage = [UIImage imageNamed:@"addButton.png"];
    [self.addButton setBackgroundImage:addButtonImage forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(onAddButtonDown:) forControlEvents:UIControlEventTouchDown];
    [self.addButton addTarget:self action:@selector(onAddButtonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.addButton];
    
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
    LSEButtonViewController *root = [[LSELibraryViewController alloc] init];
    
    // Create the Navigation Controller
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:root];
    
    // Add its view beneath all ours (including the button we made)
    [self addChildViewController:nav];
    [self.view insertSubview:nav.view atIndex:0];
    [nav didMoveToParentViewController:self];
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

- (void)onAddButtonUp:(id)sender {
    NSLog(@"Button Up");
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.addButton.frame = CGRectMake((self.view.frame.size.width - 80) / 2, CGRectGetMaxY(self.view.frame) - 100, 80, 80);
    } completion:^(BOOL finished) {
        //
    }];
}

- (void)onAddButtonDown:(id)sender {
    NSLog(@"Button Down");
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.addButton.frame = CGRectMake(self.addButton.frame.origin.x+10, self.addButton.frame.origin.y+10
                                          , self.addButton.frame.size.width-20, self.addButton.frame.size.height-20);
    } completion:^(BOOL finished) {
       //
    }];
}

@end
