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

@interface TMBEnterpriseContactSingleton ()<NSURLConnectionDelegate>

@property (nonatomic) NSMutableData* buffer;
@property(nonatomic) NSURLConnection* myConnection;

@end

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

#pragma NSURLConnection Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    [self.buffer setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [self.buffer appendData:data];
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // Do cleanup
    self.myConnection = nil;
    self.buffer     = nil;
    
    // Inform the user, most likely in a UIAlert
    NSLog(@"Enterprise Contact Singleton ConnectionConnection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    NSLog(@"Enterprise Contact Singleton Connection ERROR %@", [error localizedDescription]);
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Enterprise Contact");
    //Create a queue and dispatch the parsing of the data
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 2), ^{
        // Parse the data from JSON to an array
        NSError *error = nil;
        NSArray *jsonString = [NSJSONSerialization JSONObjectWithData:self.buffer options:NSJSONReadingMutableContainers error:&error];
        // Return to the main queue to handle the data & UI
        dispatch_async(dispatch_get_main_queue(), ^{

            
            //Check if error or not
            if (!error) {
                //If no error then PROCESS ARRAY
                NSDictionary* tempDictionary = jsonString[0];
                self.enterpriseContact = [[TMBEnterpriseContact alloc] init];
                
                
                self.enterpriseContact.name = [tempDictionary objectForKey:@"Name"];
                self.enterpriseContact.cnpj = [tempDictionary objectForKey:@"Cnpj"];
                self.enterpriseContact.email = [tempDictionary objectForKey:@"Email"];
                self.enterpriseContact.phoneNumber = [tempDictionary objectForKey:@"PhoneNumber"];
                self.enterpriseContact.whatsApp = [tempDictionary objectForKey:@"WhatsApp"];
                self.enterpriseContact.location.cep = [tempDictionary objectForKey:@"AdressCep"];
                self.enterpriseContact.location.state = [tempDictionary objectForKey:@"AdressState"];
                self.enterpriseContact.location.city = [tempDictionary objectForKey:@"AdressCity"];
                self.enterpriseContact.location.sector = [tempDictionary objectForKey:@"AdressSector"];
                self.enterpriseContact.location.street = [tempDictionary objectForKey:@"AdressStreet"];
                self.enterpriseContact.location.number = [tempDictionary objectForKey:@"AdressNumber"];
                self.enterpriseContact.location.complement = [tempDictionary objectForKey:@"AdressComplement"];

                
                //NSLog(@"%@",self.enterpriseContact);
                
                [enterpriseContactDAO updateEnterpriseContactData:self.enterpriseContact];
                
                // Call reload in order to refresh the tableview
            }else{
                NSLog(@"ERROR Enterprise Contact Singleton Connection %@", [error localizedDescription]);
                
            }
            
            //Stop animating the spinner
            // Do cleanup
            self.myConnection = nil;
            self.buffer     = nil;
        });
        
    });
}

-(BOOL)requestContactInfo{
    
    NSURL *myURL = [NSURL URLWithString:@"http://sky4gtv.com.br/php/getEnterpriseContact.php"];
    NSString *dbHost = [NSString stringWithFormat:@"sky4gtvcombr.ipagemysql.com"];
    NSString *dbPassword = [NSString stringWithFormat:@"bEk}Id)Ceas."];
    NSString *dbUserName = [NSString stringWithFormat:@"iosapp"];
    NSString *dbName = [ NSString stringWithFormat:@"sky_sales"];
    
    NSString *dataToPost = ([[NSString alloc] initWithFormat:@"DBHost=%@&DBUserName=%@&DBPassword=%@&DBName=%@",dbHost,dbUserName,dbPassword,dbName]);
	//3.  Post tag to cloud
    
    NSData *postData = [dataToPost dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:myURL];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    // Create the connection
    self.myConnection = [NSURLConnection connectionWithRequest:request delegate:self];

    //Test to make sure the connection worked
    if (self.myConnection){
        self.buffer = [NSMutableData data];
        [self.myConnection start];
        return YES;
    }else{
        NSLog(@"Enterprise Contact Singleton Connection Failed");
        
        return NO;
    }
}


@end
