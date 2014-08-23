//
//  TMBPackageDAO.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPackageDAO.h"
#import "TMBPackage.h"

@implementation TMBPackageDAO

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

-(NSData *)getColumnImage:(int)iColumn forStatement:(sqlite3_stmt *)statement{
    
    const char* raw = sqlite3_column_blob(statement,iColumn);
    int rawLength = sqlite3_column_bytes(statement, iColumn);
    NSData *imageData = [NSData dataWithBytes:raw length:rawLength];
    
    if (imageData != NULL) {
        return imageData;
    }else{
        
        return NULL;
    }
    
}

-(NSMutableArray *)getPackageList{
    
    NSMutableArray *packageList;
    TMBPackage *package;
    
    const char *dbpath = [dbPath UTF8String];
    sqlite3_stmt    *statement;
    
    
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = @"SELECT id, Name, MainImage, DetailImage, Price FROM Package";
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            packageList = [[NSMutableArray alloc] init];
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                package = [[TMBPackage alloc] init];
                
                package.packageId = sqlite3_column_int(statement, 0);
                package.name = [self getColumnText:1 forStatement:statement];
                
                package.mainImage = [[UIImage alloc] initWithData:[self getColumnImage:2 forStatement:statement]];
                package.detailImage = [[UIImage alloc] initWithData:[self getColumnImage:3 forStatement:statement]];
                package.price = (float)sqlite3_column_double(statement, 4);
                
                
                [packageList addObject:package];
                
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    
    return packageList;
    
    
    
    
}


@end
