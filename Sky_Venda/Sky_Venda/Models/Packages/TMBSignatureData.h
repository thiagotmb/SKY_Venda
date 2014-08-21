//
//  TMBSignatureData.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBPrivateSignatureDataDAO.h"
#import "TMBPrivateSignatureData.h"

@interface TMBSignatureData : NSObject

@property(nonatomic) NSString* selectedPackage;

@property (nonatomic) NSString *clientName;
@property (nonatomic) NSString *clientCpf;
@property (nonatomic) NSString *clientRg;
@property (nonatomic) NSString *clientEmail;
@property (nonatomic) NSString *clientPhoneNumber;
@property (nonatomic) NSString *clientBirthDate;
@property (nonatomic) NSString *clientSocialReason;
@property (nonatomic) NSString *clientGender;

@property (nonatomic) NSString *installationAdressCep;
@property (nonatomic) NSString *installationAdressCity;
@property (nonatomic) NSString *installationAdressState;
@property (nonatomic) NSString *installationAdressSector;
@property (nonatomic) NSString *installationAdressStreet;
@property (nonatomic) NSString *installationAdressNumber;
@property (nonatomic) NSString *installationAdressComplement;

@property(nonatomic) NSString *creditCardOperator;
@property(nonatomic) NSString *creditCardNumber;
@property(nonatomic) NSString *creditExpirationDate;

+(id)sharedData;

-(void)loadSharedData;
-(void)saveSharedData;

@end
