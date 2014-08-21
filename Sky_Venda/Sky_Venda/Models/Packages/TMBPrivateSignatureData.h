//
//  TMBPrivateSignatureData.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/20/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBPrivateSignatureData : NSObject

@property (nonatomic) NSString *clientNameDAO;
@property (nonatomic) NSString * clientCpfDAO;
@property (nonatomic) NSString * clientRgDAO;
@property (nonatomic) NSString *clientEmailDAO;
@property (nonatomic) NSString * clientPhoneNumberDAO;
@property (nonatomic) NSString *clientBirthDateDAO;
@property (nonatomic) int  clientSocialReasonDAO;
@property (nonatomic) BOOL clientGenderDAO;

@property (nonatomic) NSString * installationAdressCepDAO;
@property (nonatomic) NSString *installationAdressCityDAO;
@property (nonatomic) NSString *installationAdressStateDAO;
@property (nonatomic) NSString *installationAdressSectorDAO;
@property (nonatomic) NSString *installationAdressStreetDAO;
@property (nonatomic) NSString * installationAdressNumberDAO;
@property (nonatomic) NSString *installationAdressComplementDAO;

@property(nonatomic) int creditCardOperatorDAO;
@property(nonatomic) NSString * creditCardNumberDAO;
@property(nonatomic) NSString * creditExpirationDateDAO;


@end
