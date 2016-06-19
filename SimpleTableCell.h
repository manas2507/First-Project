//
//  SimpleTableCell.h
//  Pro
//
//  Created by Apple on 08/06/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, weak) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UITextView *textArea;

@end
