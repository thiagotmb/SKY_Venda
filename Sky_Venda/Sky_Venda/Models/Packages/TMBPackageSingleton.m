//
//  TMBPackageSingleton.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPackageSingleton.h"
#import "TMBPackageDAO.h"

@interface TMBPackageSingleton ()<NSURLConnectionDelegate>

@property (nonatomic) NSMutableData* buffer;
@property(nonatomic) NSURLConnection* myConnection;

@end

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
    NSLog(@"TMBPackageSingleton Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    NSLog(@"TMBPackageSingleton ERROR %@", [error localizedDescription]);


}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Package Data");
    //Create a queue and dispatch the parsing of the data
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Parse the data from JSON to an array
        NSError *error = nil;
        NSArray *jsonString = [NSJSONSerialization JSONObjectWithData:self.buffer options:NSJSONReadingMutableContainers error:&error];
       // NSLog(@"%@",jsonString);
        // Return to the main queue to handle the data & UI
        dispatch_async(dispatch_get_main_queue(), ^{

            //Check if error or not
            if (!error) {
                //If no error then PROCESS ARRAY

                self.packageList = [[NSMutableArray alloc] init];

                for (NSDictionary *tempDictionary in jsonString) {                    // Extract each dictionary’s username & put it into our array
                    TMBPackage* packageItem = [[TMBPackage alloc] init];
                    packageItem.packageId = [[tempDictionary objectForKey:@"id"] intValue];
                    packageItem.name = [tempDictionary objectForKey:@"Name"];
                    
                    NSData *data = [[NSData alloc]initWithBase64EncodedString:[tempDictionary objectForKey:@"MainImage"] options:NSDataBase64DecodingIgnoreUnknownCharacters];
                    packageItem.mainImage = [UIImage imageWithData:data];
                    
                    
                    NSData *data2 = [[NSData alloc]initWithBase64EncodedString:[tempDictionary objectForKey:@"DetailImage"] options:NSDataBase64DecodingIgnoreUnknownCharacters];
                    packageItem.detailImage = [UIImage imageWithData:data2];

                    packageItem.price = [[tempDictionary objectForKey:@"Price"]  floatValue];
                   // NSLog(@"%@",packageItem);
                [self.packageList addObject:packageItem];
                }
                NSLog(@"PHP SAYS %@",    [NSString stringWithContentsOfURL:connection.originalRequest.URL encoding:NSUTF8StringEncoding error:nil]);

                [packageDAO updatePackageData:self.packageList];

                // Call reload in order to refresh the tableview
                
            }else{
                NSLog(@"TMBPackageSingleton ERROR %@", [error localizedDescription]);

            }
            //Stop animating the spinner
            // Do cleanup
            self.myConnection = nil;
            self.buffer     = nil;
        });
        
    });
}

-(BOOL)requestPackageList{
    
    NSURL *myURL = [NSURL URLWithString:@"http://sky4gtv.com.br/sky_sales/php/getPackagesList.php"];
    
    NSString *dbHost = [NSString stringWithFormat:@"sky4gtvcombr.ipagemysql.com"];
    NSString *dbPassword = [NSString stringWithFormat:@"bEk}Id)Ceas."];
    NSString *dbUserName = [NSString stringWithFormat:@"iosapp"];
    NSString *dbName = [ NSString stringWithFormat:@"sky_sales"];
    
	//2.REBUILD status string from passingObject
    NSString *dataToPost = ([[NSString alloc] initWithFormat:@"DBHost=%@&DBUserName=%@&DBPassword=%@&DBName=%@",dbHost,dbUserName,dbPassword,dbName]);
    
    NSData *postData = [dataToPost dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:myURL];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    self.myConnection = [NSURLConnection connectionWithRequest:request delegate:self];
    //Test to make sure the connection worked
    if (self.myConnection){
        self.buffer = [NSMutableData data];
        [self.myConnection start];
        return YES;
    }else{
        NSLog(@"TMBPackageSingleton Connection Failed");

        return NO;
    }
}

@end
