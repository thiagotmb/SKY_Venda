//
//  TMBWebServiceDbInfoSingleton.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 9/2/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBWebServiceDbInfoSingleton.h"

@implementation TMBWebServiceDbInfoSingleton


-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@",self.class];
    
    return description;
}

-(id)init{
    
    self = [super init];
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [TMBWebServiceDbInfoSingleton sharedData]" userInfo:nil];
    
    return nil;
    
}


+(id)getWebServiceDbHost{
    
    return webServiceDbHost;
}

+(id)getWebServiceDbName{
    
    return webServiceDbName;
}

+(id)getWebServiceDbUserName{
    
    return webServiceDbUserName;
}

+(id)getWebServiceDbUserPassword{
    
    return webServiceDbUserPassword;
}

+(id)getWebServiceUrlForType:(NSInteger)type{
    
    switch (type) {
        case TMBWebServiceUrlTypeContactRequest:
            return webServiceContactRequestUrl;
            break;
        case TMBWebServiceUrlTypeSubmitSignatureData:
            return webServiceSubmitSignatureDataUrl;
            break;
        case TMBWebServiceUrlTypeGetFaqList:
            return webServiceGetFaqListUrl;
            break;
        case TMBWebServiceUrlTypeGetPackagesList:
            return webServiceGetPackagesListUrl;
            break;
        case TMBWebServiceUrlTypeGetEnterpriseContact:
            return webServiceGetPackagesListUrl;
            break;
        default:
            return nil;
            break;
    }
}




@end
