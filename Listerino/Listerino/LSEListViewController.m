//
//  LSEListViewController.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEListViewController.h"
#import "LSEItemViewController.h"
#import "LSEListCell.h"
#import "LSEItemViewController.h"
#import "LSEItem.h"

@interface LSEListViewController ()
@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) NSMutableArray *items;

- (void)onAddButtonTap:(id)sender;

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
    self.items = self.listInfo.listItems;
    
    [self.view addSubview:self.listTableView];
    
    self.title = self.listInfo.listName;

	self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 60) / 2, CGRectGetMaxY(self.view.frame) - 60, 50, 50)];
    addButton.backgroundColor = [UIColor redColor];
    [addButton addTarget:self action:@selector(onAddButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:addButton];
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listInfo.listItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"LSEListCell";

    LSEListCell *listCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    LSEItem *listItem = self.listInfo.listItems[indexPath.row];
    
    if (!listCell) {
        listCell = [[LSEListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:identifier];
    }
    
    listCell.textLabel.text = listItem.itemName;

    return listCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LSEItemViewController *itemViewController = [[LSEItemViewController alloc]init];
    itemViewController.itemInfo = [self.items objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:itemViewController animated:YES];
}

#pragma mar - Button Methods

- (void)onMessagePress:(id)sender {
    
}

//- (void)onAddButtonTap:(id)sender {
//    NSLog(@"add Item");
//    LSEItem *newItem = [[LSEItem alloc]init];
//    newItem.itemName = @"taco Bell";
//    [self.items insertObject:newItem atIndex:0];
//    [self.listTableView reloadData];
//    
//}

@end
