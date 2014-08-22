//
//  TMBInstallationAdressDataViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBTextFieldTableViewCell.h"
#import "TMBMapGetLocationTableViewCell.h"
#import "TMBPaymentDataViewController.h"

@class TMBInstallationAdress;
@interface TMBInstallationAdressDataViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *installationAdressDataTableView;

@property (nonatomic) TMBInstallationAdress *installationAdress;

- (IBAction)nextStep:(id)sender;


@end
