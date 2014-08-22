//
//  TMBSignature.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBSignature.h"

@implementation TMBSignature

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.package = 0;
        self.client = [[TMBClient alloc] init];
        self.installationAdress = [[TMBInstallationAdress alloc] init];
        self.creditCard = [[TMBCreditCard alloc] init];
        
    }
    return self;
}
-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nClient: %@\nInstallationAdress: %@\nCreditCard: %@\nPackage: %d",self.class,self.client,self.installationAdress,self.creditCard,self.package];
    
    return description;
}
@end
