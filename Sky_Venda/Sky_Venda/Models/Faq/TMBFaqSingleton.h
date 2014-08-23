//
//  TMBFaqSingleton.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMBFaq;
@interface TMBFaqSingleton : NSObject

@property (nonatomic) TMBFaq* faqItem;
@property (nonatomic) NSMutableArray* faqList;

+(id)sharedData;

-(void)loadSharedData;


@end
