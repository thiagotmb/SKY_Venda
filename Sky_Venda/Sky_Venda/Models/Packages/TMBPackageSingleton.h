//
//  TMBPackageSingleton.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBPackage.h"
#import "TMBWebServiceDbInfoSingleton.h"

@interface TMBPackageSingleton : NSObject

@property (nonatomic) TMBPackage* packageItem;
@property (nonatomic) NSMutableArray* packageList;

+(id)sharedData;

-(void)loadSharedData;

-(BOOL)requestPackageList;


@end
