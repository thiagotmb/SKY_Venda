//
//  TMBMapGetLocationTableViewCell.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBMapGetLocationTableViewCell.h"

@implementation TMBMapGetLocationTableViewCell{
    
    TMBSignatureData *sharedSignatureData;

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        sharedSignatureData = [TMBSignatureData sharedData];
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
    
    sharedSignatureData.signature.installationAdress.cep = self.Cep;
    
    
    NSLog(@"%@",self.Cep);

    
}

@end
