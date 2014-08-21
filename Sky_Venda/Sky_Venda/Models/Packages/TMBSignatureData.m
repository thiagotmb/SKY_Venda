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
        
        TMBPrivateSignatureDataDAO *storedSignatureDataDAO = [[TMBPrivateSignatureDataDAO alloc] init];
        
        TMBPrivateSignatureData *storedSignatureData = [storedSignatureDataDAO getPrivateSignatureData];
        
        if (storedSignatureData) {
            NSLog(@"OK");
            self.clientName = storedSignatureData.clientNameDAO;
            self.clientCpf = storedSignatureData.clientCpfDAO;
            self.clientRg = storedSignatureData.clientRgDAO;
            self.clientEmail = storedSignatureData.clientEmailDAO;
            self.clientPhoneNumber = storedSignatureData.clientPhoneNumberDAO;
            self.clientBirthDate = storedSignatureData.clientBirthDateDAO;
            self.clientSocialReason = [NSString stringWithFormat:@"%d",storedSignatureData.clientSocialReasonDAO];
            self.clientGender = [NSString stringWithFormat:@"%d",storedSignatureData.clientGenderDAO];
            
            self.installationAdressCep = storedSignatureData.installationAdressCepDAO;
            self.installationAdressCity = storedSignatureData.installationAdressCityDAO;
            self.installationAdressState = storedSignatureData.installationAdressStateDAO;
            self.installationAdressSector = storedSignatureData.installationAdressSectorDAO;
            self.installationAdressStreet = storedSignatureData.installationAdressStreetDAO;
            self.installationAdressNumber = storedSignatureData.installationAdressNumberDAO;
            self.installationAdressComplement = storedSignatureData.installationAdressComplementDAO;
            
            self.creditCardOperator = [NSString stringWithFormat:@"%d",storedSignatureData.creditCardOperatorDAO];
            self.creditCardNumber = storedSignatureData.creditCardNumberDAO;
            self.creditExpirationDate = storedSignatureData.creditExpirationDateDAO;
            
        }else{
            
            NSLog(@"nao tem nada no banco");
        }
        
    }
    
    return self;
    
}

@end
