//
//  TMBClientDataViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBClientDataSecondViewController.h"
#import "TMBSignatureData.h"

@interface TMBClientDataViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;
@property (nonatomic) UIImage *packagePresentationImage;

@property (weak, nonatomic) IBOutlet UITextField *clientName;
@property (weak, nonatomic) IBOutlet UITextField *clientCpf;
@property (weak, nonatomic) IBOutlet UITextField *clientRg;
@property (weak, nonatomic) IBOutlet UITextField *clientEmail;
@property (weak, nonatomic) IBOutlet UITextField *clientPhoneNumber;


- (IBAction)nextStep:(id)sender;


@end
