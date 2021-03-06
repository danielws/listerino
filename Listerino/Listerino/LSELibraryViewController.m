//
//  LSELibraryViewController.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/10/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEAppDelegate.h"
#import "LSELibraryViewController.h"
#import "LSEListViewController.h"
#import "LSELibraryCell.h"
#import "LSEList.h"
#import "LSEEditableTableViewCell.h"
#import "LSEButtonViewController.h"

@interface LSELibraryViewController ()
@property (nonatomic, strong) UITableView *libraryTableView;
@property (nonatomic, strong) NSMutableArray *lists;
@property (nonatomic, strong) LSEEditableTableViewCell *editableLibraryCell;

- (void)onAddButtonTap:(id)sender;
//- (void)onConfirmButtonTap:(id)sender;

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    // set navigation bar's tint color when being shown
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    LSEButtonViewController *buttonViewController = [LSEButtonViewController sharedInstance];
    [buttonViewController changeButtonTypeForViewController:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up the tableView data source and delegate
    self.libraryTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.libraryTableView.dataSource = self;
    self.libraryTableView.delegate = self;
    self.libraryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.lists = [[LSEList fakeLists] mutableCopy];
    
    UIButton *addListButton = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 60) / 2, CGRectGetMaxY(self.view.frame) - 60, 50, 50)];
    addListButton.backgroundColor = [UIColor redColor];
    [addListButton addTarget:self action:@selector(onAddButtonTap:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.libraryTableView];
//    [self.view addSubview:addListButton];

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LSEList *list = self.lists[indexPath.row];

    // All the identifiers, one per each type of cell
    static NSString *libraryIdentifier = @"LSELibraryCell";
    static NSString *editableIdentifier = @"LSEEditableCell";
    
    // Figure out which cell identifier we need to use based on our data model
    NSString *identifier = libraryIdentifier;
    if (list.isEditing) {
        identifier = editableIdentifier;
    }
    
    // Try to pull a cell out of the cache using the key `identifier`
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // If there is not one in our cache...
    if (!cell) {
        
        // Alloc the new cell of the type that is represented by the identifier
        if ([identifier isEqualToString:libraryIdentifier]) {
            LSELibraryCell *libraryCell = [[LSELibraryCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                                reuseIdentifier:identifier];
            cell = libraryCell;
        } else if ([identifier isEqualToString:editableIdentifier]) {
            _editableLibraryCell = [[LSEEditableTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                                                     reuseIdentifier:identifier];
            _editableLibraryCell.listNameTextField.delegate = self;
            cell = self.editableLibraryCell;
        }
    }
    
    // Configure the cell with the item data
    if ([identifier isEqualToString:libraryIdentifier]) {
        NSString *listName = list.listName;
        LSELibraryCell *libraryCell = (LSELibraryCell *)cell;
        libraryCell.textLabel.text = listName;
        
        //style cells?
        libraryCell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:38];
        libraryCell.textLabel.textColor = [UIColor whiteColor];
        libraryCell.textLabel.textAlignment = NSTextAlignmentCenter;
        libraryCell.backgroundColor = [UIColor blueColor];
        
    } else if ([identifier isEqualToString:editableIdentifier]) {
//        LSEEditableTableViewCell *editableCell = (LSEEditableTableViewCell *)cell;
        // tell the label to become first responder
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LSEListViewController *listViewController = [[LSEListViewController alloc]init];
    
    listViewController.listInfo = [self.lists objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:listViewController animated:YES];
}

- (void)onMessagePress:(id)sender {
    
}

- (void)onAddButtonTap:(id)sender {

    LSEList *list = [[LSEList alloc] init];
    list.isEditing = YES;

    [_lists insertObject:list atIndex:0];
    [_libraryTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}


- (void)editableCell {
    LSEList *list = [[LSEList alloc] init];
    list.isEditing = YES;
    [_lists insertObject:list atIndex:0];
    [_libraryTableView reloadData];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];

    LSEList *list = [_lists firstObject];
    
    if (!list) {
        return YES;
    }
    
    if (textField.text.length == 0) {
        list.isEditing = NO;
        [_lists removeObjectAtIndex:0];
        [_libraryTableView reloadData];
        return YES;
    }
    
    list.isEditing = NO;
    list.listName = textField.text;
    
    [_libraryTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    
    return YES;
}

@end
