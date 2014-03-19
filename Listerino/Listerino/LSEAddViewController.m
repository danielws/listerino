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

@end
