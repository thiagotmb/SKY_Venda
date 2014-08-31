//
//  TMBClient.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBClient.h"

@implementation TMBClient

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = [[NSString alloc] init];
        self.cpf = [[NSString alloc] init];
        self.rg = [[NSString alloc] init];
        self.email = [[NSString alloc] init];
        self.phoneNumber = [[NSString alloc] init];
        
        self.birthDate = [[NSDate alloc]init];
        
    }
    return self;
}
-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nName: %@\nCPF: %@\nRG: %@\nEmail: %@\nPhoneNumber: %@\nBirthDate: %@\nGender: %d\nSocialReazon: %d",self.class,self.name,self.cpf,self.rg,self.email,self.phoneNumber,self.birthDate,self.gender,self.civilState];
    
    return description;
}


@end
