//
//  TMBSignature.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBClient.h"
#import "TMBInstallationAdress.h"
#import "TMBCreditCard.h"


@interface TMBSignature : NSObject

@property (nonatomic) int package;
@property (nonatomic) TMBClient *client;
@property (nonatomic) TMBInstallationAdress *installationAdress;
@property (nonatomic) TMBCreditCard *creditCard;

-(NSString*)getStringFromDate:(NSDate*)dateToConvert;
-(NSDate*)getDateFromString:(NSString*)string;


@end
