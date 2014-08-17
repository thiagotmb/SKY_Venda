//
//  TMBMapGetLocationTableViewCell.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBMapGetLocationTableViewCell.h"

@implementation TMBMapGetLocationTableViewCell

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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)getMyLocation:(id)sender {
    
    self.MAP.image = [UIImage imageNamed:@"map.png"];
    self.Cep = @"73801280";
    [[TMBSignatureData sharedData] setInstallationAdressCep:self.Cep];
    
    NSLog(@"%@",self.Cep);

    
}

@end
