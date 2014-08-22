//
//  TMBTextFieldTableViewCell.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBTextFieldTableViewCell.h"
#import "TMBSignatureSingleton.h"
@implementation TMBTextFieldTableViewCell{
    
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
    self.textField.delegate = self;
    sharedSignatureData = [TMBSignatureSingleton sharedData];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case TMBClientNameTextFieldTag:
            sharedSignatureData.signature.client.name = textField.text;
            break;
        case TMBClientCpfTextFieldTag:
            sharedSignatureData.signature.client.cpf = textField.text;
            break;
        case TMBClientRgTextFieldTag:
            sharedSignatureData.signature.client.rg = textField.text;
            break;
        case TMBClientEmailTextFieldTag:
            sharedSignatureData.signature.client.email = textField.text;
            break;
        case TMBClientPhoneNumberTextFieldTag:
            sharedSignatureData.signature.client.phoneNumber = textField.text;
            break;
        case TMBInstallationAdressCepTextFieldTag:
            sharedSignatureData.signature.installationAdress.cep = textField.text;
            break;
        case TMBInstallationAdressCityTextFieldTag:
            sharedSignatureData.signature.installationAdress.city = textField.text;
            break;
        case TMBInstallationAdressStateTextFieldTag:
            sharedSignatureData.signature.installationAdress.state = textField.text;
            break;
        case TMBInstallationAdressSectorTextFieldTag:
            sharedSignatureData.signature.installationAdress.sector = textField.text;
            break;
        case TMBInstallationAdressStreetTextFieldTag:
            sharedSignatureData.signature.installationAdress.street = textField.text;
            break;
        case TMBInstallationAdressNumberTextFieldTag:
            sharedSignatureData.signature.installationAdress.number = textField.text;
            break;
        case TMBInstallationAdressComplementTextFieldTag:
            sharedSignatureData.signature.installationAdress.complement = textField.text;
            break;
        default:
            break;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SaveTheData" object:self];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super endEditing:YES];
}


@end
