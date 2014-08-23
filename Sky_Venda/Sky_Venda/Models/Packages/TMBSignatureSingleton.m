//
//  TMBSignatureSingleton.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBSignatureSingleton.h"
#import "TMBPrivateSignatureDataDAO.h"
@implementation TMBSignatureSingleton{

    TMBPrivateSignatureDataDAO *signatureDAO;

}

+(id)sharedData{
    
    static TMBSignatureSingleton *sharedData = nil;
    
    if (!sharedData) {
        
        sharedData = [[self alloc] initPrivate];
        
    }
    return sharedData;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nSignature: %@",self.class,self.signature];
    
    return description;
}

-(id)init{
    
    self = [super init];
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBSignatureSingleton sharedData]" userInfo:nil];
    
    return nil;
    
}

-(id)initPrivate{
    
    self = [super init];
    
    if (self) {
        
        self.signature = [[TMBSignature alloc] init];
        signatureDAO = [[TMBPrivateSignatureDataDAO alloc] init];
    }
    
    return self;
    
}



-(void)loadSharedData{
    
    
    self.signature = [signatureDAO getSignatureData];

}

-(void)saveSharedData{
  
    [signatureDAO saveSignatureData:self.signature];
   
}

@end
