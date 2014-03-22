//
//  LSEEditableTableViewCell.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/18/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEEditableTableViewCell.h"
#import "LSELibraryViewController.h"

@interface LSEEditableTableViewCell()
@end

@implementation LSEEditableTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _listNameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        [_listNameTextField setReturnKeyType:UIReturnKeyDone];
        _listNameTextField.clearsOnBeginEditing = YES;
        _listNameTextField.placeholder = @"New List...";
        [self.contentView addSubview:_listNameTextField];

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews
{
[super layoutSubviews];
[_listNameTextField becomeFirstResponder];

self.listNameTextField.frame = CGRectMake(5, 5, 300, 40);
self.listNameTextField.backgroundColor = [UIColor redColor];
self.backgroundColor = [UIColor whiteColor];

}

//- (void)textViewDidEndEditing:(UITextView *)textView {
//    [self.listNameTextField resignFirstResponder];
//    NSString *newListName = self.listNameTextField.text;
//}

//- (bool)textFieldShouldReturn:(UITextField *)textField {
//    
//    [textField resignFirstResponder];
//    NSLog(@"done editing");
//    self.textFieldString = textField.text;
////    [LSELibraryViewController addl]
//
//    return YES;
//}

@end
