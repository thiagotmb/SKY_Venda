//
//  TMBClientDataFourthViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBClientDataFifthViewController.h"
#import "TMBSignatureData.h"

@interface TMBClientDataFourthViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;
@property (nonatomic) UIImage *packagePresentationImage;

@property (weak, nonatomic) IBOutlet UITextField *installationAdressCep;

- (IBAction)getMyLocation:(id)sender;
- (IBAction)nextStep:(id)sender;


@end
