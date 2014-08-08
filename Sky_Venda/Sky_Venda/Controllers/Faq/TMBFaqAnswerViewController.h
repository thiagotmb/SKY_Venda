//
//  TMBFaqAnswerViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBFaqAnswerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (nonatomic) NSString *questionText;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (nonatomic) NSString* answerText;

@end
