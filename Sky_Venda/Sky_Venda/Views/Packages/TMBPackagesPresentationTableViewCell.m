//
//  TMBPackagesPresentationTableViewCell.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPackagesPresentationTableViewCell.h"

@implementation TMBPackagesPresentationTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = [UIColor clearColor];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
