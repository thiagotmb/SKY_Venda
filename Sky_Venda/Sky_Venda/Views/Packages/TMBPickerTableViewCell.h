//
//  TMBPickerTableViewCell.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBPickerTableViewCell : UITableViewCell<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic) NSArray *pickerData;
@property (nonatomic) NSInteger numberOfComponentsInPickerView;

@end
