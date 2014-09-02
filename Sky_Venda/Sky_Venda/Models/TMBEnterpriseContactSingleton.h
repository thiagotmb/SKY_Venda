//
//  TMBEnterpriseContactSingleton.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/23/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBWebServiceDbInfoSingleton.h"

@class TMBEnterpriseContact;
@interface TMBEnterpriseContactSingleton : NSObject

@property (nonatomic) TMBEnterpriseContact *enterpriseContact;

+(id)sharedData;

-(void)loadSharedData;

-(BOOL)requestContactInfo;


@end
