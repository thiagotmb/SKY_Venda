//
//  TMBEnterpriseContactDAO.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/23/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBEnterpriseContactDAO.h"
#import "TMBEnterpriseContact.h"

@implementation TMBEnterpriseContactDAO

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

-(TMBEnterpriseContact *)getEnterpriseContact{
    
    TMBEnterpriseContact *enterpriseContact;
    
    
    const char *dbpath = [dbPath UTF8String];
    sqlite3_stmt    *statement;
    
    
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = @"SELECT PhoneNumber, WhatsApp, Email, Cnpj, Name, AdressCep, AdressState, AdressCity, AdressSector, AdressStreet, AdressNumber, AdressComplement FROM EnterpriseContact";
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                enterpriseContact = [[TMBEnterpriseContact alloc] init];
                
                enterpriseContact.phoneNumber = [self getColumnText:0 forStatement:statement];
                enterpriseContact.whatsApp = [self getColumnText:1 forStatement:statement];
                enterpriseContact.email = [self getColumnText:2 forStatement:statement];
                enterpriseContact.cnpj = [self getColumnText:3 forStatement:statement];
                enterpriseContact.name = [self getColumnText:4 forStatement:statement];
                enterpriseContact.location.cep = [self getColumnText:5 forStatement:statement];
                enterpriseContact.location.state = [self getColumnText:6 forStatement:statement];
                enterpriseContact.location.city = [self getColumnText:7 forStatement:statement];
                enterpriseContact.location.sector = [self getColumnText:8 forStatement:statement];
                enterpriseContact.location.street = [self getColumnText:9 forStatement:statement];
                enterpriseContact.location.number = [self getColumnText:10 forStatement:statement];
                enterpriseContact.location.complement = [self getColumnText:11 forStatement:statement];
                
                
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    
    return enterpriseContact;
}


@end
