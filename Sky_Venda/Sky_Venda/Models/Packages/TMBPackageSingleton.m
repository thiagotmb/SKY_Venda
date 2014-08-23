//
//  TMBPackageSingleton.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPackageSingleton.h"
#import "TMBPackage.h"
#import "TMBPackageDAO.h"

@implementation TMBPackageSingleton{
    
    TMBPackageDAO *packageDAO;
}

+(id)sharedData{
    
    static TMBPackageSingleton *sharedData = nil;
    
    if (!sharedData) {
        
        sharedData = [[self alloc] initPrivate];
        
    }
    return sharedData;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nPackageList: %@",self.class,self.packageList];
    
    return description;
}

-(id)init{
    
    self = [super init];
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBPackageSingleton sharedData]" userInfo:nil];
    
    return nil;
    
}

-(id)initPrivate{
    
    self = [super init];
    
    if (self) {
        
        self.packageItem = [[TMBPackage alloc] init];
        packageDAO = [[TMBPackageDAO alloc] init];
        
    }
    
    return self;
    
}

-(void)loadSharedData{
    
    self.packageList = [packageDAO getPackageList];
}


@end
