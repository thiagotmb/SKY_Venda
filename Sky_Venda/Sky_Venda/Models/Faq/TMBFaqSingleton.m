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

@interface TMBFaqSingleton ()

@property (nonatomic) NSMutableData* buffer;
@property(nonatomic) NSURLConnection* myConnection;


@end

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


# pragma NSURLConnection Methods

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
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    NSLog(@"ERROR %@", [error localizedDescription]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DataRecieved" object:nil userInfo:[NSDictionary dictionaryWithObject:@"Error"forKey:@"Connection"]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Faq Data");
    //Create a queue and dispatch the parsing of the data
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Parse the data from JSON to an array
        NSError *error = nil;
        NSArray *jsonString = [NSJSONSerialization JSONObjectWithData:self.buffer options:NSJSONReadingMutableContainers error:&error];
        
        // Return to the main queue to handle the data & UI
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //Check if error or not
            if (!error) {
                //If no error then PROCESS ARRAY
                self.faqList = [[NSMutableArray alloc] init];
                for (NSDictionary *tempDictionary in jsonString) {                    // Extract each dictionary’s username & put it into our array
                    TMBFaq* faqItem = [[TMBFaq alloc] init];
                    faqItem.answer = [tempDictionary objectForKey:@"Answer"];
                    faqItem.question = [tempDictionary objectForKey:@"Question"];
                    
                    NSData *data = [[NSData alloc]initWithBase64EncodedString:[tempDictionary objectForKey:@"Image"] options:NSDataBase64DecodingIgnoreUnknownCharacters];
                    faqItem.image = [UIImage imageWithData:data];

                    faqItem.questionId = [[tempDictionary objectForKey:@"id"]  intValue];
                    [self.faqList addObject:faqItem];
                }
                [faqDAO updateFaqData:self.faqList];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"DataRecieved" object:nil userInfo:[NSDictionary dictionaryWithObject:@"Sucess"forKey:@"Connection"]];
                
                // Call reload in order to refresh the tableview
                
            }else{
                NSLog(@"ERROR %@", [error localizedDescription]);
                [[NSNotificationCenter defaultCenter] postNotificationName:@"DataRecieved" object:nil userInfo:[NSDictionary dictionaryWithObject:@"Error"forKey:@"Connection"]];
            }
            
            //Stop animating the spinner
            // Do cleanup
            self.myConnection = nil;
            self.buffer     = nil;
        });
        
    });
}

-(BOOL)requestFaqList{

    NSURL *myURL = [NSURL URLWithString:@"http://localhost/~thiagoMB/getFaqList.php"];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    // Create the connection
    self.myConnection = [NSURLConnection connectionWithRequest:myRequest delegate:self];
    //Test to make sure the connection worked
    if (self.myConnection){
        self.buffer = [NSMutableData data];
        [self.myConnection start];
        return YES;
    }else{
        NSLog(@"Connection Failed");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DataRecieved" object:nil userInfo:[NSDictionary dictionaryWithObject:@"Error"forKey:@"Connection"]];
        return NO;
    }
}


@end
