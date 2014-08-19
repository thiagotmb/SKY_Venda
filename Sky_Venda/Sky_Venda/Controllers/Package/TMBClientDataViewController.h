//
//  TMBClientDataViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBInstallationAdressDataViewController.h"
#import "TMBSignatureData.h"
#import "TMBTextFieldTableViewCell.h"
#import "TMBPickerTableViewCell.h"
#import "TMBDatePickerTableViewCell.h"

@interface TMBClientDataViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;

@property (weak, nonatomic) IBOutlet UITableView *clientDataTableView;


@property (weak, nonatomic) UITextField *clientName;
@property (weak, nonatomic) UITextField *clientCpf;
@property (weak, nonatomic) UITextField *clientRg;
@property (weak, nonatomic) UITextField *clientEmail;
@property (weak, nonatomic) UITextField *clientPhoneNumber;

@property (nonatomic) UIDatePicker *birthDatePickerView;

@property (weak, nonatomic) UIPickerView *genderPickerView;
@property (nonatomic) NSArray *genderPickerData;
@property (weak, nonatomic) UIPickerView *socialReasonPickerView;
@property (nonatomic) NSArray *socialReasonPickerData;


- (IBAction)nextStep:(id)sender;


@end
