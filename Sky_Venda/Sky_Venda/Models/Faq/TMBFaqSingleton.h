//
//  TMBFaqSingleton.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBWebServiceDbInfoSingleton.h"

@class TMBFaq;
@interface TMBFaqSingleton : NSObject<NSURLConnectionDelegate>

@property (nonatomic) TMBFaq* faqItem;
@property (nonatomic) NSMutableArray* faqList;

+(id)sharedData;

-(void)loadSharedData;

-(BOOL)requestFaqList;

@end
