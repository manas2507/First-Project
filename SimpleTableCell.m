//
//  SimpleTableCell.m
//  Pro
//
//  Created by Apple on 08/06/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell
@synthesize nameLabel = _nameLabel;
@synthesize thumbnailImageView = _thumbnailImageView;
@synthesize textArea = _textArea;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
