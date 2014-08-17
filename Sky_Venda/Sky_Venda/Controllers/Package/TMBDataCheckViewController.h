//
//  TMBDataCheckViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBPackageAdhesionViewController.h"
#import "TMBSignatureData.h"
#import "TMBTextLabelTableViewCell.h"


@interface TMBDataCheckViewController : UIViewController<UITableViewDataSource,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *packagePresentation;
@property (nonatomic) UIImage *packagePresentationImage;

@property (weak, nonatomic) IBOutlet UITableView *dataCheckTableView;

@end
