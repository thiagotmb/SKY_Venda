//
//  TMBEnterpriseContactSingleton.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/23/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBEnterpriseContactSingleton.h"
#import "TMBEnterpriseContact.h"
#import "TMBEnterpriseContactDAO.h"
@implementation TMBEnterpriseContactSingleton
{
    
    TMBEnterpriseContactDAO *enterpriseContactDAO;
}

+(id)sharedData{
    
    static TMBEnterpriseContactSingleton *sharedData = nil;
    
    if (!sharedData) {
        
        sharedData = [[self alloc] initPrivate];
        
    }
    return sharedData;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nEnterpriseContact: %@",self.class,self.enterpriseContact];
    
    return description;
}

-(id)init{
    
    self = [super init];
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBEnterpriseContactSingleton sharedData]" userInfo:nil];
    
    return nil;
    
}

-(id)initPrivate{
    
    self = [super init];
    
    if (self) {
        
        self.enterpriseContact = [[TMBEnterpriseContact alloc] init];
        enterpriseContactDAO = [[TMBEnterpriseContactDAO alloc] init];
        
    }
    
    return self;
    
}

-(void)loadSharedData{
    
    self.enterpriseContact = [enterpriseContactDAO getEnterpriseContact];
    //NSLog(@"%@",self.enterpriseContact);
}



@end
