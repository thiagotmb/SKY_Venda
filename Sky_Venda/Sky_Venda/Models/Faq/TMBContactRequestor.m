//
//  TMBContactRequestor.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/27/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBContactRequestor.h"

@implementation TMBContactRequestor
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contact = [[NSString alloc] init];
        self.dateOfRequest = [[NSString alloc] init];
        self.type = 0;
    }
    return self;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nType: %d\nContact: %@\nDateOfRequest: %@",self.class,self.type,self.contact,self.dateOfRequest];
    
    return description;
}
@end
