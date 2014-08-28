//
//  TMBPackageDAO.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class TMBPackage;

@interface TMBPackageDAO : NSObject{
    
    sqlite3 *database;
    NSString *dbPath;
}

-(NSString*)getColumnText:(int)iColumn forStatement:(sqlite3_stmt*)statement;
-(NSData*)getColumnImage:(int)iColumn forStatement:(sqlite3_stmt*)statement;


-(NSMutableArray*)getPackageList;
-(BOOL)savePackageData:(TMBPackage*)packageData;
-(BOOL)updatePackageData:(NSArray*)packagesList;

@end
