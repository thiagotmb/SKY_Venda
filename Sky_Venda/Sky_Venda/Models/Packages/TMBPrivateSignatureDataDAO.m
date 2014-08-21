//
//  TMBPrivateSignatureDataDAO.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/20/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPrivateSignatureDataDAO.h"

@implementation TMBPrivateSignatureDataDAO

-(id)init{
    
    self = [super init];
    
    if (self) {
        dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"SKY_VENDA.sqlite"];
    }
    return self;
}

-(TMBPrivateSignatureData *)getPrivateSignatureData{
    
    TMBPrivateSignatureData *signatureData;
    
    @try{
        NSFileManager* fileManager = [NSFileManager defaultManager];
        BOOL sucess = [fileManager fileExistsAtPath:dbPath];
        
        if (sucess) {
            
            if((sqlite3_open([dbPath UTF8String], &database)) == SQLITE_OK){
                
                const char *sqlProgram = "select Name, Cpf, Rg, Email, PhoneNumber, BirthDate, SocialReason, Gender, Cep, City, State, Sector, Street, AdressNumber, Complement, CreditCardOperator, CreditCardNumber, CreditCardExpiration FROM SignatureData";
                sqlite3_stmt *sqlStatement;
                
                if (sqlite3_prepare(database, sqlProgram, -1, &sqlStatement, NULL) == SQLITE_OK) {
                    
                    if (sqlite3_step(sqlStatement)) {
                        signatureData = [[TMBPrivateSignatureData alloc] init];
                        
                        
                        signatureData.clientNameDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 0)];
                        signatureData.clientCpfDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 1)];;
                        signatureData.clientRgDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 2)];;
                        signatureData.clientEmailDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 3)];
                        signatureData.clientPhoneNumberDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 4)];
                        signatureData.clientBirthDateDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 5)];;
                    
                        signatureData.clientSocialReasonDAO = sqlite3_column_int(sqlStatement, 6);
                        signatureData.clientGenderDAO = sqlite3_column_int(sqlStatement, 7);
                        
                        
                        signatureData.installationAdressCepDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 8)];
                        signatureData.installationAdressCityDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 9)];
                        signatureData.installationAdressStateDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 10)];
                        signatureData.installationAdressSectorDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 11)];
                        signatureData.installationAdressStreetDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 12)];
                        signatureData.installationAdressNumberDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 13)];
                        signatureData.installationAdressComplementDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 14)];

                        signatureData.creditCardOperatorDAO = sqlite3_column_int(sqlStatement, 15);
                        signatureData.creditCardNumberDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 16)];
                        signatureData.creditExpirationDateDAO = [NSString stringWithUTF8String:(char*)sqlite3_column_text(sqlStatement, 17)];
                        
                    }
                    
                }else{
                    
                    NSLog(@"Can't prepare statement");
                }
                
            }else{
                
                NSLog(@"Database can't open");
            }
            
        }else{
            NSLog(@"Can't locate database file at path %@:",dbPath);
        }
    }
    @catch (NSException *exception){
        
        NSLog(@"Exception in get users: %@", [exception reason]);
    }
    @finally{
        return signatureData;
    }
    
}

-(void)updatePrivateSignatureData{
    
    TMBSignatureData *signatureData = [TMBSignatureData sharedData];
    
    BOOL sucess = NO;
    
    sqlite3_stmt *statement = NULL;
    
    
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
        
        
    }
    
}
    
    

@end
