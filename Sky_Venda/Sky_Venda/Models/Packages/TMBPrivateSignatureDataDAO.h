//
//  TMBPrivateSignatureDataDAO.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/20/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class TMBSignature;
@interface TMBPrivateSignatureDataDAO : NSObject{
    
    sqlite3 *database;
    NSString *dbPath;
}

-(TMBSignature*) getSignatureData;

-(NSString*)getColumnText:(int)iColumn forStatement:(sqlite3_stmt*)statement;

-(BOOL)saveSignatureData;

@end
