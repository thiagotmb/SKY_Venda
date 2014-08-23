//
//  TMBPackage.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBPackage : NSObject

@property (nonatomic) int packageId;
@property (nonatomic) NSString* name;
@property (nonatomic) UIImage* mainImage;
@property (nonatomic) UIImage* detailImage;
@property (nonatomic) float price;

@end
