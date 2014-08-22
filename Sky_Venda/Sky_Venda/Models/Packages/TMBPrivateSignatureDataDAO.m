//
//  TMBPrivateSignatureDataDAO.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/20/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPrivateSignatureDataDAO.h"
#import "TMBSignature.h"

@implementation TMBPrivateSignatureDataDAO

-(id)init{
    
    self = [super init];
    
    if (self) {
        dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"SKY_VENDA.sqlite"];
    }
    return self;
}

-(NSString*)getColumnText:(int)iColumn forStatement:(sqlite3_stmt*)statement{
    if (sqlite3_column_type(statement, iColumn) != SQLITE_NULL) {
        return [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, iColumn)];
    }else{
        
        return nil;
    }
}

-(TMBSignature *)getSignatureData{
    
    TMBSignature *signatureData;
    
    
    const char *dbpath = [dbPath UTF8String];
    sqlite3_stmt    *statement;
    
    
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = @"SELECT Name, Cpf, Rg, Email, PhoneNumber, BirthDate, SocialReason, Gender, Cep, City, State, Sector, Street, AdressNumber, Complement, CreditCardOperator, CreditCardNumber, CreditCardExpiration FROM SignatureData";
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                signatureData = [[TMBSignature alloc] init];
                

                signatureData.client.name = [self getColumnText:0 forStatement:statement];
                signatureData.client.cpf = [self getColumnText:1 forStatement:statement];;
                
                signatureData.client.rg = [self getColumnText:2 forStatement:statement];;;
                signatureData.client.email = [self getColumnText:3 forStatement:statement];;
                signatureData.client.phoneNumber = [self getColumnText:4 forStatement:statement];;
                
                
                NSDate *storedBirthDate = [signatureData getDateFromString:[self getColumnText:5 forStatement:statement]];
                signatureData.client.birthDate = storedBirthDate;
                
                signatureData.client.socialReason = sqlite3_column_int(statement, 6);
                signatureData.client.gender = sqlite3_column_int(statement, 7);
                
                
                signatureData.installationAdress.cep = [self getColumnText:8 forStatement:statement];;
                signatureData.installationAdress.city = [self getColumnText:9 forStatement:statement];;
                signatureData.installationAdress.state = [self getColumnText:10 forStatement:statement];;
                signatureData.installationAdress.sector = [self getColumnText:11 forStatement:statement];;
                signatureData.installationAdress.street = [self getColumnText:12 forStatement:statement];;
                signatureData.installationAdress.number = [self getColumnText:13 forStatement:statement];;
                signatureData.installationAdress.complement = [self getColumnText:14 forStatement:statement];
                
                signatureData.creditCard.operatorCode = sqlite3_column_int(statement, 15);
                signatureData.creditCard.number = [self getColumnText:16 forStatement:statement];;
                
                NSDate *storedExpiratoinDate = [signatureData getDateFromString:[self getColumnText:17 forStatement:statement]];
                signatureData.client.birthDate = storedExpiratoinDate;
                signatureData.creditCard.expiration = storedExpiratoinDate;



            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    
    return signatureData;    
}
/*
-(BOOL)savePrivateSignatureData{
    
    TMBSignatureSingleton *sharedSignatureData = [TMBSignatureSingleton sharedData];
    
    TMBPrivateSignatureData *signatureData = [self getPrivateSignatureData];
    BOOL sucess = NO;
    
    sqlite3_stmt *statement = NULL;
    
    
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {

        if (signatureData.clientCpfDAO != nil) {
            
            NSString *updateSQL = [NSString stringWithFormat:@"UPDATE SignatureData set Name = '%@', Cpf = '%@', Rg = '%@', Email = '%@', PhoneNumber = '%@', BirthDate = '%@', SocialReason = '%@', Gender = '%@', Cep = '%@', City = '%@', State = '%@', Sector = '%@', Street = '%@', AdressNumber = '%@', Complement = '%@', CreditCardOperator = '%@', CreditCardNumber = '%@', CreditCardExpiration = '%@' ",sharedSignatureData.clientName,sharedSignatureData.clientCpf,sharedSignatureData.clientRg,sharedSignatureData.clientEmail,sharedSignatureData.clientPhoneNumber, sharedSignatureData.clientBirthDate, sharedSignatureData.clientSocialReason, sharedSignatureData.clientGender, sharedSignatureData.installationAdressCep, sharedSignatureData.installationAdressCity, sharedSignatureData.installationAdressState, sharedSignatureData.installationAdressSector, sharedSignatureData.installationAdressStreet, sharedSignatureData.installationAdressNumber, sharedSignatureData.installationAdressComplement, sharedSignatureData.creditCardOperator, sharedSignatureData.creditCardNumber, sharedSignatureData.creditExpirationDate];
            const char* update_stmt = [updateSQL UTF8String];
            NSLog(@"%@",updateSQL);

            sqlite3_prepare_v2(database, update_stmt, -1, &statement, NULL);
                       
            if (sqlite3_step(statement) == SQLITE_DONE) {
                sucess = true;
            }


        }else{
            
            NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO SignatureData (Name, Cpf, Rg) VALUES (\"%@\", \"%@\", \"%@\")",sharedSignatureData.clientName,sharedSignatureData.clientCpf,sharedSignatureData.clientRg];
            const char* insert_stmt = [insertSQL UTF8String];

            sqlite3_prepare_v2(database, insert_stmt, -1, &statement, NULL);
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                sucess = true;
            }
            
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(database);
    }
    
    return sucess;
}
   */ 
    

@end
