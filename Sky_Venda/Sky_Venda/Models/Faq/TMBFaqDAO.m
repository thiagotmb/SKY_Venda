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


@end
