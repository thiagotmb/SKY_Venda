//
//  TMBEnterpriseContact.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/23/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBAdress.h"

@interface TMBEnterpriseContact : NSObject

@property (nonatomic) int enterpriseId;
@property (nonatomic) NSString* phoneNumber;
@property (nonatomic) NSString* whatsApp;
@property (nonatomic) NSString* email;
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* cnpj;
@property (nonatomic) TMBAdress* location;


@end
