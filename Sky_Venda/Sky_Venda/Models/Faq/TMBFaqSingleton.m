//
//  TMBFaqSingleton.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBFaqSingleton.h"
#import "TMBFaqDAO.h"
#import "TMBFaq.h"

@implementation TMBFaqSingleton{
    
    TMBFaqDAO *faqDAO;
}

+(id)sharedData{
    
    static TMBFaqSingleton *sharedData = nil;
    
    if (!sharedData) {
        
        sharedData = [[self alloc] initPrivate];
        
    }
    return sharedData;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nFaqList: %@",self.class,self.faqList];
    
    return description;
}

-(id)init{
    
    self = [super init];
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBFaqSingleton sharedData]" userInfo:nil];
    
    return nil;
    
}

-(id)initPrivate{
    
    self = [super init];
    
    if (self) {
        
        self.faqItem = [[TMBFaq alloc] init];
        faqDAO = [[TMBFaqDAO alloc] init];
        
    }
    
    return self;
    
}

-(void)loadSharedData{
    
    
    self.faqList = [faqDAO getFaqList];
    
}


@end
