//
//  TMBSignatureData.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBSignatureData.h"

@implementation TMBSignatureData

+(id)sharedData{
    
    static TMBSignatureData *sharedData = nil;
    
    if (!sharedData) {
        
        sharedData = [[self alloc] initPrivate];
        
    }
    
    return sharedData;
}

-(id)init{
    
    self = [super init];
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBSignatureData sharedData]" userInfo:nil];
    
    return nil;
    
}

-(id)initPrivate{
    
    self = [super init];
    
    if (self) {
        self.clientName = [[NSString alloc] initWithString:nil];
        self.clientCpf = [[NSString alloc] initWithString:nil];
        self.clientRg = [[NSString alloc] initWithString:nil];
        self.clientEmail = [[NSString alloc] initWithString:nil];
        self.clientPhoneNumber = [[NSString alloc] initWithString:nil];
        self.clientBirthDate = [[NSString alloc] initWithString:nil];
        self.clientSocialReason = [[NSString alloc] initWithString:nil];
        self.clientGender = [[NSString alloc] initWithString:nil];
        
        self.instalationAdressCep = [[NSString alloc] initWithString:nil];
        self.instalationAdressCity = [[NSString alloc] initWithString:nil];
        self.instalationAdressState = [[NSString alloc] initWithString:nil];
        self.instalationAdressSector = [[NSString alloc] initWithString:nil];
        self.instalationAdressStreet = [[NSString alloc] initWithString:nil];
        self.instalationAdressNumber = [[NSString alloc] initWithString:nil];
        self.instalationAdressComplement = [[NSString alloc] initWithString:nil];
        
        self.creditCardNumber = [[NSString alloc] initWithString:nil];
        self.creditExpirationDate = [[NSString alloc] initWithString:nil]; 
    }
    
    return self;
    
}

-(id)getSharedData:(NSUInteger)TMBSignatureDataType{
    
    switch (TMBSignatureDataType) {
        case TMBSignatureDataTypeClientName:
            return self.clientName;
            break;
        case TMBSignatureDataTypeClientCpf:
            return self.clientCpf;
            break;
        case TMBSignatureDataTypeClientRg:
            return self.clientRg;
            break;
        case TMBSignatureDataTypeClientEmail:
            return self.clientEmail;
            break;
        case TMBSignatureDataTypeClientPhoneNumber:
            return self.clientPhoneNumber;
            break;
        case TMBSignatureDataTypeClientBirthDate:
            return self.clientBirthDate;
            break;
        case TMBSignatureDataTypeClientSocialReason:
            return self.clientSocialReason;
            break;
        case TMBSignatureDataTypeClientGender:
            return self.clientGender;
            break;
            
        case TMBSignatureDataTypeInstalationAdressCep:
            return self.instalationAdressCep;
            break;
        case TMBSignatureDataTypeInstalationAdressCity:
            return self.instalationAdressCity;
            break;
        case TMBSignatureDataTypeInstalationAdressState:
            return self.instalationAdressState;
            break;
        case TMBSignatureDataTypeInstalationAdressSector:
            return self.instalationAdressSector;
            break;
        case TMBSignatureDataTypeInstalationAdressStreet:
            return self.instalationAdressStreet;
            break;
        case TMBSignatureDataTypeInstalationAdressNumber:
            return self.instalationAdressNumber;
            break;
        case TMBSignatureDataTypeInstalationAdressComplement:
            return self.instalationAdressComplement;
            break;
            
        case TMBSignatureDataTypeCreditCardNumber:
            return self.creditCardNumber;
            break;
        case TMBSignatureDataTypeCreditCardExpirationDate:
            return self.creditExpirationDate;
            break;
            
        default:
            return nil;
            break;
    }
    
}

-(void)setSharedData:(NSUInteger)TMBSignatureDataType withData:(NSString*)data{
    
//
    
    switch (TMBSignatureDataType) {
        case TMBSignatureDataTypeClientName:
            self.clientName = data;
            break;
        case TMBSignatureDataTypeClientCpf:
            self.clientCpf = data;
            break;
        case TMBSignatureDataTypeClientRg:
            self.clientRg = data;
            break;
        case TMBSignatureDataTypeClientEmail:
            self.clientEmail = data;
            break;
        case TMBSignatureDataTypeClientPhoneNumber:
            self.clientPhoneNumber = data;
            break;
        case TMBSignatureDataTypeClientBirthDate:
            self.clientBirthDate = data;
            break;
        case TMBSignatureDataTypeClientSocialReason:
            self.clientSocialReason = data;
            break;
        case TMBSignatureDataTypeClientGender:
            self.clientGender = data;
            break;
            
        case TMBSignatureDataTypeInstalationAdressCep:
            self.instalationAdressCep = data;
            break;
        case TMBSignatureDataTypeInstalationAdressCity:
            self.instalationAdressCity = data;
            break;
        case TMBSignatureDataTypeInstalationAdressState:
            self.instalationAdressState = data;
            break;
        case TMBSignatureDataTypeInstalationAdressSector:
            self.instalationAdressSector = data;
            break;
        case TMBSignatureDataTypeInstalationAdressStreet:
            self.instalationAdressStreet = data;
            break;
        case TMBSignatureDataTypeInstalationAdressNumber:
            self.instalationAdressNumber = data;
            break;
        case TMBSignatureDataTypeInstalationAdressComplement:
            self.instalationAdressComplement = data;
            break;
            
        case TMBSignatureDataTypeCreditCardNumber:
            self.creditCardNumber = data;
            break;
        case TMBSignatureDataTypeCreditCardExpirationDate:
            self.creditExpirationDate = data;
            break;
            
        default:
            //Empty
            break;
    }
    
    
}

@end
