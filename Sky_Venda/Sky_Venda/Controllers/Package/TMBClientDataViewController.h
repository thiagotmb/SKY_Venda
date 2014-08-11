//
//  TMBClientDataViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBClientDataSecondViewController.h"

@interface TMBClientDataViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;
@property (nonatomic) UIImage *packagePresentationImage;

@property (weak, nonatomic) IBOutlet UIPickerView *genderPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *socialReasonPickerView;

@end
