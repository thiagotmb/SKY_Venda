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
    
    TMBInstallationAdressCepTextFieldTag = 5,
    TMBInstallationAdressCityTextFieldTag = 6,
    TMBInstallationAdressStateTextFieldTag = 7,
    TMBInstallationAdressSectorTextFieldTag = 8,
    TMBInstallationAdressStreetTextFieldTag = 9,
    TMBInstallationAdressNumberTextFieldTag = 10,
    TMBInstallationAdressComplementTextFieldTag = 11,
};

@end
