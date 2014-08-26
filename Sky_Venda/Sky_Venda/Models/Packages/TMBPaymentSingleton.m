//
//  TMBPaymentSingleton.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/25/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPaymentSingleton.h"

@implementation TMBPaymentSingleton

+(id)sharedData{
    
    static TMBPaymentSingleton *sharedData = nil;
    
    if (!sharedData) {
        
        sharedData = [[self alloc] initPrivate];
        
    }
    return sharedData;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nPackageList: %@",self.class,self.creditCardInfo];
    
    return description;
}

-(id)init{
    
    self = [super init];
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBPaymentSingleton sharedData]" userInfo:nil];
    
    return nil;
    
}

-(id)initPrivate{
    
    self = [super init];
    
    if (self) {
        
        self.creditCardInfo = [[CardIOCreditCardInfo alloc] init];
        
    }
    
    return self;
    
}


@end
