//
//  TMBCorreiosCepSearchViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBSignatureData.h"
#import "TMBClientDataFifthViewController.h"

@interface TMBCorreiosCepSearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;
@property (nonatomic) UIImage *packagePresentationImage;

@property (weak, nonatomic) IBOutlet UITextField *installationAdressCep;

- (IBAction)nextStep:(id)sender;

@end
