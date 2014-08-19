//
//  TMBPackageAdhesionViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBSignatureData.h"

@interface TMBPackageAdhesionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;

- (IBAction)submitPackageSignature:(id)sender;


@end
