//
//  TMBFaqDAO.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBFaqDAO.h"
#import "TMBFaq.h"

@implementation TMBFaqDAO

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

-(NSMutableArray *)getFaqList{
    
    NSMutableArray *faqList;
    TMBFaq *faq;
    
    const char *dbpath = [dbPath UTF8String];
    sqlite3_stmt    *statement;
    
    
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = @"SELECT id, Question, Answer, Image FROM Faq";
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            faqList = [[NSMutableArray alloc] init];
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                faq = [[TMBFaq alloc] init];
                
                faq.questionId = sqlite3_column_int(statement, 0);
                faq.question = [self getColumnText:1 forStatement:statement];
                faq.answer = [self getColumnText:2 forStatement:statement];
                
                const char* raw = sqlite3_column_blob(statement,3);
                int rawLength = sqlite3_column_bytes(statement, 3);
                NSData *photoData = [NSData dataWithBytes:raw length:rawLength];
                faq.image = [[UIImage alloc] initWithData:photoData];

                [faqList addObject:faq];
                            
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    
    return faqList;
    
    
    
    
}

-(BOOL)updateFaqData:(NSArray*)faqList{

    sqlite3_stmt *statement = NULL;
    
    const char* delete_stmt = "DELETE FROM Faq";
    
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
    
    for (TMBFaq* faqItem in faqList) {
      sucess = [self saveFaqData:faqItem];
    }
    
    
    return  sucess;
}

-(BOOL)saveFaqData:(TMBFaq*)faqItem{
    
    BOOL sucess = NO;
    sqlite3_stmt *statement = NULL;
    long long int lastRowID;
    
    const char* update_stmt = "INSERT INTO Faq (Question,Answer) VALUES (?,?)";
    
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
        
        
        if (sqlite3_prepare_v2(database, update_stmt, -1, &statement, NULL) == SQLITE_OK){
        }
        
        
        if (sqlite3_bind_text(statement, 1, [faqItem.question UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
            NSLog(@"prepare failed: %s", sqlite3_errmsg(database));
        
        if (sqlite3_bind_text(statement, 2, [faqItem.answer UTF8String], -1, NULL) != SQLITE_OK)
            NSLog(@"bind 2 failed: %s", sqlite3_errmsg(database));
        lastRowID = sqlite3_last_insert_rowid(database);
        
        if ( faqItem.image != (id)[NSNull null] ) {
            UIImage *uiimg = faqItem.image;
            NSData *data = UIImagePNGRepresentation(uiimg);
            if (sqlite3_bind_blob(statement, 3, [data bytes], (int)[data length], SQLITE_TRANSIENT) != SQLITE_OK)
                sucess = NO;
        }
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            sucess = YES;
        }
        else
        {
            NSLog(@"TMBFAqDAO failed: %s", sqlite3_errmsg(database));
            sucess = NO;
        }
        
        
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(database);
    
    
    return sucess;
}

@end
