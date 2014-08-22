//
//  TMBCreditCard.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBCreditCard.h"

@implementation TMBCreditCard
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.number = [[NSString alloc]init];
        self.expiration = [[NSDate alloc] init];
        self.operatorCode = 0;
    }
    return self;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nNumber: %@\nExpiration: %@\nOperatorCode: %d",self.class,self.number,self.expiration,self.operatorCode];
    
    return description;
}

@end
