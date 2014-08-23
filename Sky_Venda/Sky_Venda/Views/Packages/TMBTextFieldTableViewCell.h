//
//  TMBTextFieldTableViewCell.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBTextFieldTableViewCell : UITableViewCell<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

enum TMBTextFieldTag:NSInteger{
    
    TMBClientNameTextFieldTag = 0,
    TMBClientCpfTextFieldTag = 1,
    TMBClientRgTextFieldTag = 2,
    TMBClientEmailTextFieldTag = 3,
    TMBClientPhoneNumberTextFieldTag = 4,
    
    TMBAdressCepTextFieldTag = 5,
    TMBAdressCityTextFieldTag = 6,
    TMBAdressStateTextFieldTag = 7,
    TMBAdressSectorTextFieldTag = 8,
    TMBAdressStreetTextFieldTag = 9,
    TMBAdressNumberTextFieldTag = 10,
    TMBAdressComplementTextFieldTag = 11,
};


-(void)updateTextField:(NSNotification*)notification;


@end
