//
//  TMBDatePickerTableViewCell.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBDatePickerTableViewCell.h"
#import "TMBSignatureSingleton.h"

@implementation TMBDatePickerTableViewCell{
    
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
    [self.datePickerView addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
    self.backgroundColor = [UIColor clearColor];


    
}


-(IBAction)updateDate:(UIDatePicker*)datePicker{

    switch (datePicker.tag) {
        case TMBClientBirhDatePickerTag:
            sharedSignatureData.signature.client.birthDate = datePicker.date;
            break;

        default:
            break;
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [super endEditing:YES];
}

@end
