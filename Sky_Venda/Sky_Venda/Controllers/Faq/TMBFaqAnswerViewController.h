//
//  TMBFaqAnswerViewController.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMBFaq;

@interface TMBFaqAnswerViewController : UIViewController

@property (nonatomic,strong) TMBFaq* faqItem;

@property (weak, nonatomic) IBOutlet UILabel *question;

@property (weak, nonatomic) IBOutlet UITextView *answerText;


@end
