//
//  TMBEnterpriseContact.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/23/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBEnterpriseContact.h"
@implementation TMBEnterpriseContact

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.enterpriseId = 0;
        self.whatsApp = [[NSString alloc] init];
        self.phoneNumber = [[NSString alloc] init];
        self.whatsApp = [[NSString alloc] init];
        self.email  = [[NSString alloc] init];
        self.name = [[NSString alloc] init];
        self.cnpj = [[NSString alloc] init];
        self.location = [[TMBAdress alloc] init];
        
    }
    return self;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nid: %d\nName: %@\nCnpj: %@\nLocation: %@\nEmail: %.@\nPhoneNumber: %.@\nWhatsApp: %.@",self.class,self.enterpriseId,self.name,self.cnpj,self.location,self.email,self.phoneNumber,self.whatsApp];
    
    return description;
}



@end
