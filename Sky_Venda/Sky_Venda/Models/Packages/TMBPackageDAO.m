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
        NSString * docsPath= NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES)[0];
        [docsPath stringByAppendingPathComponent:@"studets.db"];
        dbPath = [docsPath stringByAppendingPathComponent:@"SKY_VENDA.sqlite"];    }
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
   // NSLog(@"%@",packageList);

    return packageList;
    
    
    
    
}


-(BOOL)updatePackageData:(NSArray*)packagesList{

    sqlite3_stmt *statement = NULL;
    const char* delete_stmt = "DELETE FROM Package";
    
    BOOL sucess = NO;
    
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
        
        
        if (sqlite3_exec(database, delete_stmt, NULL, NULL, NULL) == SQLITE_OK) {
            sucess = YES;
        }else{
            sucess =  NO;
        }
    }
    

    sqlite3_finalize(statement);
    sqlite3_close(database);
    
    
    for (TMBPackage* packageItem in packagesList) {
        sucess = [self savePackageData:packageItem];
    }
    
    
    return  sucess;
}

-(BOOL)savePackageData:(TMBPackage*)packageData{

    BOOL sucess = NO;
    sqlite3_stmt *statement = NULL;
    long long int lastRowID;
    

    const char* update_stmt = "INSERT INTO Package (Name,MainImage,DetailImage,Price) VALUES (?,?,?,?)";

    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
        
        
        if (sqlite3_prepare_v2(database, update_stmt, -1, &statement, NULL) == SQLITE_OK){
        }
        
        
        if (sqlite3_bind_text(statement, 1, [packageData.name UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
            NSLog(@"prepare failed: %s", sqlite3_errmsg(database));
        
        
        if ( packageData.mainImage != (id)[NSNull null] ) {
            UIImage *uiimg = packageData.mainImage;
            NSData *data = UIImagePNGRepresentation(uiimg);
            if (sqlite3_bind_blob(statement, 2, [data bytes], (int)[data length], SQLITE_TRANSIENT) != SQLITE_OK)
                sucess = NO;
        }
        
        
        if ( packageData.detailImage != (id)[NSNull null] ) {
            UIImage *uiimg = packageData.detailImage;
            NSData *data = UIImagePNGRepresentation(uiimg);
            if (sqlite3_bind_blob(statement, 3, [data bytes], (int)[data length], SQLITE_TRANSIENT) != SQLITE_OK)
                sucess = NO;
        }
                
        if ( sqlite3_bind_double(statement, 4, packageData.price) != SQLITE_OK)
            NSLog(@"prepare failed: %s", sqlite3_errmsg(database));
        
        lastRowID = sqlite3_last_insert_rowid(database);


        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            sucess = YES;
        }
        else
        {
            NSLog(@"TMBPackageDAO failed: %s", sqlite3_errmsg(database));
            sucess = NO;
        }
        
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(database);
    
    
    return sucess;
}


@end
