//
//  LSEEditableTableViewCell.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/18/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSEEditableTableViewCell.h"

@interface LSEEditableTableViewCell()
@property (nonatomic, strong) UITextField *listNameTextField;
@end

@implementation LSEEditableTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITextField *listNameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.listNameTextField = listNameTextField;
        [self.contentView addSubview:listNameTextField];
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
self.listNameTextField.frame = CGRectMake(5, 5, 300, 40);
self.listNameTextField.backgroundColor = [UIColor redColor];
self.backgroundColor = [UIColor whiteColor];
}

@end
