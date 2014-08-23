//
//  TMBAdress.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBAdress : NSObject

@property (nonatomic) NSString* cep;
@property (nonatomic) NSString* state;
@property (nonatomic) NSString* city;
@property (nonatomic) NSString* sector;
@property (nonatomic) NSString* street;
@property (nonatomic) NSString* number;
@property (nonatomic) NSString* complement;

@end
