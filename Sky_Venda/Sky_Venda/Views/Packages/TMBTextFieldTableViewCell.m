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
    self.titleLabel.userInteractionEnabled = YES;
    
    sharedSignatureData = [TMBSignatureSingleton sharedData];
    self.backgroundColor = [UIColor clearColor];

    [self updateLabel];
    

    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateLabel{
    
    if (self.textField.text.length == 0) {
        [UIView animateWithDuration:0.5f
                              delay:0.f
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self.titleLabel setAlpha:0];
                         }
                         completion:nil];
    }else{
        [UIView animateWithDuration:0.5f
                              delay:0.f
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self.titleLabel setAlpha:1];
                         }
                         completion:nil];
        
        
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
   
        [UIView animateWithDuration:0.5f
                              delay:0.f
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self.titleLabel setAlpha:1];
                         }
                         completion:nil];

    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return [self saveTexField:textField];
    [self updateLabel];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self updateLabel];
    
    [self saveTexField:textField];
    
}


-(BOOL)saveTexField:(UITextField*)textField{
    switch (textField.tag) {
        case TMBClientNameTextFieldTag:
            sharedSignatureData.signature.client.name = textField.text;
            return NO;
            break;
        case TMBClientCpfTextFieldTag:
            sharedSignatureData.signature.client.cpf = textField.text;
            return YES;
            break;
        case TMBClientRgTextFieldTag:
            sharedSignatureData.signature.client.rg = textField.text;
            return YES;
            break;
        case TMBClientEmailTextFieldTag:
            sharedSignatureData.signature.client.email = textField.text;
            return YES;
            break;
        case TMBClientPhoneNumberTextFieldTag:
            sharedSignatureData.signature.client.phoneNumber = textField.text;
            return YES;
            break;
        case TMBAdressCepTextFieldTag:
            sharedSignatureData.signature.installationAdress.cep = textField.text;
            return YES;
            break;
        case TMBAdressCityTextFieldTag:
            sharedSignatureData.signature.installationAdress.city = textField.text;
            return YES;
            break;
        case TMBAdressStateTextFieldTag:
            sharedSignatureData.signature.installationAdress.state = textField.text;
            return YES;
            break;
        case TMBAdressSectorTextFieldTag:
            sharedSignatureData.signature.installationAdress.sector = textField.text;
            return YES;
            break;
        case TMBAdressStreetTextFieldTag:
            sharedSignatureData.signature.installationAdress.street = textField.text;
            return YES;
            break;
        case TMBAdressNumberTextFieldTag:
            sharedSignatureData.signature.installationAdress.number = textField.text;
            return YES;
            break;
        case TMBAdressComplementTextFieldTag:
            sharedSignatureData.signature.installationAdress.complement = textField.text;
            return YES;
            break;
        default:
            return YES;
            break;
    }

}

-(void)datePickerValueChanged:(UIDatePicker*)datePicker{
    
    
    switch (datePicker.tag) {
        case TMBClientBirhDatePickerTag:
            sharedSignatureData.signature.client.birthDate = datePicker.date;
            self.textField.text = [sharedSignatureData.signature getStringFromDate:datePicker.date];
            break;
            
        default:
            break;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    switch (pickerView.tag) {
        case TMBClientGenderPickerTag:
            sharedSignatureData.signature.client.gender = row;
            self.textField.text = self.pickerData[[pickerView selectedRowInComponent:component]];

            break;
        case TMBClientSocialReasonPickerTag:
            sharedSignatureData.signature.client.socialReason = row;
            self.textField.text = self.pickerData[[pickerView selectedRowInComponent:component]];
            break;
        default:
            break;
    }
    
}
-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *title = self.pickerData[row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super endEditing:YES];
}

@end
