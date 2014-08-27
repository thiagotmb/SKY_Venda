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

+ (BOOL)postNewSignature:(TMBSignature*)signature{
    //1.  Log the tag for verification first
    
	//2.REBUILD status string from passingObject
	NSString *dataToPost = ([[NSString alloc] initWithFormat:@"Name=%@&Cpf=%@&Rg=%@&Email=%@&PhoneNumber=%@&BirthDate=%@&SocialReason=%d&Gender=%hhd&Cep=%@&City=%@&State=%@&Sector=%@&Street=%@&AdressNumber=%@&Complement=%@&creditCardOperator=%d&CreditCardNumber=%@&CreditCardExpiration=%@&Package=%d&SubmitDate=%@",signature.client.name,signature.client.cpf,signature.client.rg,signature.client.email,signature.client.phoneNumber,[signature getStringFromDate:signature.client.birthDate],signature.client.socialReason,signature.client.gender,signature.installationAdress.cep,signature.installationAdress.city,signature.installationAdress.state,signature.installationAdress.sector,signature.installationAdress.street,signature.installationAdress.number,signature.installationAdress.complement,signature.creditCard.operatorCode,signature.creditCard.number,[signature getStringFromDate:signature.creditCard.expiration],signature.package.packageId,[signature getStringFromDate:[NSDate date]]]);
	//3.  Post tag to cloud
    
    NSData *postData = [dataToPost dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost/~thiagoMB/writephp.php"]];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLResponse *response;
    NSError *error;
	// We should probably be parsing the data returned by this call, for now just check the error.
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"%@!",request);
    return (error == nil);
}

-(void)loadSharedData{
    
    
    self.signature = [signatureDAO getSignatureData];

}

-(void)saveSharedData{
  
    [signatureDAO saveSignatureData:self.signature];
   
}

@end
