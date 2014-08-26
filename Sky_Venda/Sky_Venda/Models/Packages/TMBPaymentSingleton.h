//
//  TMBPaymentSingleton.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/25/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardIOCreditCardInfo.h"

@interface TMBPaymentSingleton : NSObject

@property (nonatomic) CardIOCreditCardInfo* creditCardInfo;


+(id)sharedData;


@end
