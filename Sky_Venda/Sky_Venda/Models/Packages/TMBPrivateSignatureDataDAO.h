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

-(NSString*)getColumnText:(int)iColumn forStatement:(sqlite3_stmt*)statement;

-(TMBSignature*) getSignatureData;
-(BOOL)saveSignatureData:(TMBSignature*)signatureData;

@end
