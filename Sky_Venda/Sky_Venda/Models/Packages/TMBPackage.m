//
//  TMBPackage.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPackage.h"

@implementation TMBPackage

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.packageId = 0;
        self.name = [[NSString alloc] init];
        self.mainImage = [[UIImage alloc] init];
        self.detailImage = [[UIImage alloc] init];
        self.price = 0;
        
    }
    return self;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nid: %d\nName: %@\nMainImage: %@\nDetailImage: %@\nPrice: %.2f",self.class,self.packageId,self.name,self.mainImage,self.detailImage,self.price];
    
    return description;
}

@end
