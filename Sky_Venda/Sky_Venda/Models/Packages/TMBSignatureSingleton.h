//
//  TMBSignatureSingleton.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBSignature.h"



@class TMBSignature;

@interface TMBSignatureSingleton : NSObject

@property (nonatomic) TMBSignature* signature;

+(id)sharedData;

-(void)loadSharedData;
-(void)saveSharedData;

@end
