//
//  TMBSignatureData.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBSignatureData : NSObject

@property (nonatomic) NSString *clientName;
@property (nonatomic) NSString *clientCpf;
@property (nonatomic) NSString *clientRg;
@property (nonatomic) NSString *clientEmail;
@property (nonatomic) NSString *clientPhoneNumber;
@property (nonatomic) NSString *clientBirthDate;
@property (nonatomic) NSString *clientSocialReason;
@property (nonatomic) NSString *clientGender;

@property (nonatomic) NSString *instalationAdressCep;
@property (nonatomic) NSString *instalationAdressCity;
@property (nonatomic) NSString *instalationAdressState;
@property (nonatomic) NSString *instalationAdressSector;
@property (nonatomic) NSString *instalationAdressStreet;
@property (nonatomic) NSString *instalationAdressNumber;
@property (nonatomic) NSString *instalationAdressComplement;

@property(nonatomic) NSString *creditCardNumber;
@property(nonatomic) NSString *creditExpirationDate;


enum TMBSignatureDataType : NSUInteger{
    
    TMBSignatureDataTypeClientName = 0,
    TMBSignatureDataTypeClientCpf = 1,
    TMBSignatureDataTypeClientRg = 2,
    TMBSignatureDataTypeClientEmail = 3,
    TMBSignatureDataTypeClientPhoneNumber = 4,
    TMBSignatureDataTypeClientBirthDate = 5,
    TMBSignatureDataTypeClientSocialReason = 6,
    TMBSignatureDataTypeClientGender = 7,
    
    TMBSignatureDataTypeInstalationAdressCep = 8,
    TMBSignatureDataTypeInstalationAdressCity = 9,
    TMBSignatureDataTypeInstalationAdressState = 10,
    TMBSignatureDataTypeInstalationAdressSector = 11,
    TMBSignatureDataTypeInstalationAdressStreet = 12,
    TMBSignatureDataTypeInstalationAdressNumber = 13,
    TMBSignatureDataTypeInstalationAdressComplement = 14,
    
    TMBSignatureDataTypeCreditCardNumber = 15,
    TMBSignatureDataTypeCreditCardExpirationDate = 16,
       
};

+(id)sharedData;
-(id)getSharedData:(NSUInteger)TMBSignatureDataType;
-(void)setSharedData:(NSUInteger)TMBSignatureDataType withData:(NSString*)data;

@end
