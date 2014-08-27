//
//  TMBFaq.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/22/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBFaq.h"

@implementation TMBFaq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.question = [[NSString alloc] init];
        self.answer = [[NSString alloc] init];
        self.image = [[UIImage alloc] initWithData:nil];
        self.questionId = 0;
    }
    return self;
}

-(NSString *)description{
    
    NSString *description = [NSString stringWithFormat:@"Object: %@\nid: %d\nQuestion: %@\nAnswer: %@\nImage: %@",self.class,self.questionId,self.question,self.answer,self.image];
    
    return description;
}


@end
