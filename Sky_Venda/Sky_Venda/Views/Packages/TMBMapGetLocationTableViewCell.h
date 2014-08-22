//
//  TMBMapGetLocationTableViewCell.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBSignatureSingleton.h"
@interface TMBMapGetLocationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *MAP;
@property (nonatomic) NSString* Cep; 

- (IBAction)getMyLocation:(id)sender;


@end
