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
        self.submitDate = [[NSDate alloc] init];
        
    }
    return self;
}
-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nClient: %@\nInstallationAdress: %@\nCreditCard: %@\nPackage: %d\nSubmitDate: %@",self.class,self.client,self.installationAdress,self.creditCard,self.package,self.submitDate];
    
    return description;
}

-(NSString*)getStringFromDate:(NSDate*)dateToConvert{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString;
    dateString = [dateFormat stringFromDate:dateToConvert];

    return dateString;
}

-(NSDate*)getDateFromString:(NSString*)string{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateToGet;
    dateToGet = [dateFormat dateFromString:string];

    return dateToGet;
}
@end
