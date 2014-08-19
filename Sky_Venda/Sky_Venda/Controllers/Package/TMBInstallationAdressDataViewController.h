//
//  TMBInstallationAdressDataViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBSignatureData.h"
#import "TMBTextFieldTableViewCell.h"
#import "TMBMapGetLocationTableViewCell.h"
#import "TMBPaymentDataViewController.h"


@interface TMBInstallationAdressDataViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *installationAdressDataTableView;

@property (nonatomic) UITextField *installationAdressCep;
@property (nonatomic) UITextField *installationAdressCity;
@property (nonatomic) UITextField *installationAdressState;
@property (nonatomic) UITextField *installationAdressSector;
@property (nonatomic) UITextField *installationAdressStreet;
@property (nonatomic) UITextField *installationAdressNumber;
@property (nonatomic) UITextField *installationAdressComplement;

- (IBAction)nextStep:(id)sender;


@end
