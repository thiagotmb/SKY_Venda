//
//  TMBwebServiceDbInfoSingleton.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 9/2/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSString* webServiceDbHost = @"localhost";
static const NSString* webServiceDbName = @"skyfougt_sky_sales";
static const NSString* webServiceDbUserName = @"skyfougt_iosapp";
static const NSString* webServiceDbUserPassword = @"Cec0gef7donn";

static const NSString* webServiceContactRequestUrl = @"http://sky4gtv.com.br/sky_sales/php/contactRequest.php";
static const NSString* webServiceSubmitSignatureDataUrl = @"http://sky4gtv.com.br/sky_sales/php/submitSignatureData.php";
static const NSString* webServiceGetFaqListUrl = @"http://sky4gtv.com.br/sky_sales/php/getFaqList.php";
static const NSString* webServiceGetPackagesListUrl = @"http://sky4gtv.com.br/sky_sales/php/getPackagesList.php";
static const NSString* webServiceGetEnterpriseContact = @"http://sky4gtv.com.br/sky_sales/php/getEnterpriseContact.php";





@interface TMBWebServiceDbInfoSingleton : NSObject

enum TMBWebServiceUrlType: NSInteger{
    
    TMBWebServiceUrlTypeGetFaqList = 0,
    TMBWebServiceUrlTypeGetPackagesList = 1,
    TMBWebServiceUrlTypeGetEnterpriseContact = 2,
    TMBWebServiceUrlTypeSubmitSignatureData = 3,
    TMBWebServiceUrlTypeContactRequest = 4,

    

};

+(id)getWebServiceDbHost;
+(id)getWebServiceDbName;
+(id)getWebServiceDbUserName;
+(id)getWebServiceDbUserPassword;
+(id)getWebServiceUrlForType:(NSInteger)type;


@end
