//
//  TMBPrivateSignatureDataDAO.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/20/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "TMBPrivateSignatureData.h"
#import "TMBSignatureData.h"

@interface TMBPrivateSignatureDataDAO : NSObject{
    
    sqlite3 *database;
    NSString *dbPath;
}

-(TMBPrivateSignatureData*) getPrivateSignatureData;

-(BOOL)savePrivateSignatureData;

@end
