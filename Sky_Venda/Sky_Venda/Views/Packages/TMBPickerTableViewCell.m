//
//  TMBPickerTableViewCell.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPickerTableViewCell.h"
#import "TMBSignatureSingleton.h"
@implementation TMBPickerTableViewCell{
    
    TMBSignatureSingleton *sharedSignatureData;
}


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
    sharedSignatureData = [TMBSignatureSingleton sharedData];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];
  // Configure the view for the selected state
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super endEditing:YES];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    switch (pickerView.tag) {
        case TMBClientGenderPickerTag:
            sharedSignatureData.signature.client.gender = row;
            break;
        case TMBClientSocialReasonPickerTag:
            sharedSignatureData.signature.client.socialReason = row;
            break;
        default:
            break;
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return self.numberOfComponentsInPickerView;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.pickerData.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.pickerData[row];
}

@end
