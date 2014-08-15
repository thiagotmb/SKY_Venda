//
//  TMBClientDataThirdViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/12/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBClientDataFourthViewController.h"

@interface TMBClientDataThirdViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;
@property (nonatomic) UIImage *packagePresentationImage;

@property (weak, nonatomic) IBOutlet UIPickerView *genderPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *socialReasonPickerView;

@end
