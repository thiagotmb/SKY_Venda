//
//  TMBCreditCard.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBCreditCard : NSObject

@property (nonatomic) int operatorCode;
@property (nonatomic) NSString* number;
@property (nonatomic) NSDate* expiration;

@end
