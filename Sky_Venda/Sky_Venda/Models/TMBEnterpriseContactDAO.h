//
//  TMBEnterpriseContactDAO.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/23/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class TMBEnterpriseContact;
@interface TMBEnterpriseContactDAO : NSObject{
    
    sqlite3 *database;
    NSString *dbPath;
}

-(NSString*)getColumnText:(int)iColumn forStatement:(sqlite3_stmt*)statement;

-(TMBEnterpriseContact*) getEnterpriseContact;


@end
