//
//  TMBInstallationAdress.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBInstallationAdress.h"

@implementation TMBInstallationAdress

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.cep = [[NSString alloc] init];
        self.state = [[NSString alloc] init];
        self.city = [[NSString alloc] init];
        self.sector = [[NSString alloc] init];
        self.street = [[NSString alloc] init];
        self.number = [[NSString alloc] init];
        self.complement = [[NSString alloc] init];
    }
    return self;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nCep: %@\nState: %@\nCity: %@\nSector: %@\nStreet: %@\nNumber: %@\nComplement: %@",self.class,self.cep,self.state,self.city,self.sector,self.street,self.number,self.complement];
    
    return description;
}

@end
