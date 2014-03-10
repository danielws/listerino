//
//  LSELibraryViewController.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSELibraryViewController.h"
#import "LSEListViewController.h"

@interface LSELibraryViewController ()
@property (nonatomic, strong) UITableView *libraryTableView;

@end

@implementation LSELibraryViewController

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
    
    // Set up the tableView data source and delegate
    self.libraryTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.libraryTableView.dataSource = self;
    self.libraryTableView.delegate = self;
    [self.view addSubview:self.libraryTableView];
    
    self.title = @"Listerino";

	self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _libraryTableView.frame = self.view.bounds;
}


#pragma mark - TableView Methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = [NSString stringWithFormat:@"This is row %d", indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LSEListViewController *listViewController = [[LSEListViewController alloc]init];
//    listViewController.listInfo = [self.notifs objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:listViewController animated:YES];
}

- (void)onMessagePress:(id)sender {
    
}

@end
