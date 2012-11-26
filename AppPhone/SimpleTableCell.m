//
//  SimpleTableCell.m
//  10-30練習text
//
//  Created by 張泓威 on 12/10/30.
//  Copyright (c) 2012年 張泓威. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell
@synthesize nameLabel = _nameLabel;
@synthesize telLabe=_telLabe;
@synthesize thumbnailImageView = _thumbnailImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
 
    // Configure the view for the selected state
}

@end
