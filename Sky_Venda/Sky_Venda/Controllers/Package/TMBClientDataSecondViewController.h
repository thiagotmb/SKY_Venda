//
//  TMBClientDataSecondViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBClientDataThirdViewController.h"

@interface TMBClientDataSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;
@property (nonatomic) UIImage *packagePresentationImage;

@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePickerView;

@end
