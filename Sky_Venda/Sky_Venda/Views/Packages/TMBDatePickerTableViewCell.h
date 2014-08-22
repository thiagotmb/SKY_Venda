//
//  TMBDatePickerTableViewCell.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/16/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBDatePickerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerView;

enum TMBDatePickerTag:NSInteger{
    
    TMBClientBirhDatePickerTag = 0,

};

@end
