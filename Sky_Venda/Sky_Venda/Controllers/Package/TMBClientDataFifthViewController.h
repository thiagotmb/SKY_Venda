//
//  TMBClientDataFifthViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBPaymentDataViewController.h"
#import "TMBSignatureData.h"



@interface TMBClientDataFifthViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;
@property (nonatomic) UIImage *packagePresentationImage;

@property (weak, nonatomic) IBOutlet UITextField *installationAdressCity;
@property (weak, nonatomic) IBOutlet UITextField *installationAdressState;
@property (weak, nonatomic) IBOutlet UITextField *installationAdressSector;
@property (weak, nonatomic) IBOutlet UITextField *installationAdressStreet;
@property (weak, nonatomic) IBOutlet UITextField *installationAdressNumber;
@property (weak, nonatomic) IBOutlet UITextField *installationAdressComplement;


- (IBAction)nextStep:(id)sender;


@end
