//
//  TMBFaqDAO.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface TMBFaqDAO : NSObject{
    
    sqlite3* database;
    NSString* dbPath;
}

-(NSString*)getColumnText:(int)iColumn forStatement:(sqlite3_stmt*)statement;

-(NSMutableArray*)getFaqList;

@end
