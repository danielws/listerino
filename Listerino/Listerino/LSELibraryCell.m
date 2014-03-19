//
//  LSELibraryCell.m
//  Listerino
//
//  Created by Daniel Warner Smith on 3/15/14.
//  Copyright (c) 2014 LangSmith Enterprises Worldwide. All rights reserved.
//

#import "LSELibraryCell.h"
#import "LSEList.h"

@interface LSELibraryCell ()
@end

@implementation LSELibraryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.listNameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.window addSubview:self.listNameLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _listNameLabel.frame = CGRectMake(5, 5, 100, 40);
    _listNameLabel.backgroundColor = [UIColor redColor];
    self.backgroundColor = [UIColor greenColor];
}

@end
