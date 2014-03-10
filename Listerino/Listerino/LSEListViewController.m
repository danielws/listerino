//
//  LSEListViewController.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEListViewController.h"
#import "LSEItemViewController.h"

@interface LSEListViewController ()
@property (nonatomic, strong) UITableView *listTableView;
@end

@implementation LSEListViewController

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
    self.listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.listTableView.dataSource = self;
    self.listTableView.delegate = self;
    [self.view addSubview:self.listTableView];
    
    self.title = @"List";

	self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _listTableView.frame = self.view.bounds;
}

#pragma mark - TableView Methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = [NSString stringWithFormat:@"This is row %d", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LSEItemViewController *itemViewController = [[LSEItemViewController alloc]init];
    //    itemViewController.listInfo = [self.notifs objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:itemViewController animated:YES];
}

- (void)onMessagePress:(id)sender {
    
}

@end
