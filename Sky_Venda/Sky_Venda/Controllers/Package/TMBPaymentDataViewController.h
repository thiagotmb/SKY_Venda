//
//  TMBPaymentDataViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBSignatureData.h"
#import "TMBPackageAdhesionViewController.h"

@interface TMBPaymentDataViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;

@property (weak, nonatomic) IBOutlet UITextField *creditCardNumber;
@property (weak, nonatomic) IBOutlet UIPickerView *creditCardExpirationDatePicker;



- (IBAction)nextStep:(id)sender;

@end
