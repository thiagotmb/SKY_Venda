//
//  TMBClientDataViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBInstallationAdressDataViewController.h"
#import "TMBTextFieldTableViewCell.h"

@class TMBClient;

@interface TMBClientDataViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;

@property (weak, nonatomic) IBOutlet UITableView *clientDataTableView;

@property (nonatomic) NSArray *genderPickerData;
@property (nonatomic) NSArray *civilStatePickerData;

@property TMBClient *client;



@end
