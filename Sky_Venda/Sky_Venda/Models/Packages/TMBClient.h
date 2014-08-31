//
//  TMBClient.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBClient : NSObject

@property NSString *name;
@property NSString *cpf;
@property NSString *rg;
@property NSString *email;
@property NSString *phoneNumber;

@property NSDate *birthDate;

@property BOOL gender;
@property int civilState;

@end
