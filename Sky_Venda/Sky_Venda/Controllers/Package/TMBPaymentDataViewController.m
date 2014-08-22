//
//  TMBPaymentDataViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPaymentDataViewController.h"
#import "TMBCreditCard.h"

@interface TMBPaymentDataViewController ()

@end

@implementation TMBPaymentDataViewController{
    
    TMBSignatureSingleton *sharedSignatureData;

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    sharedSignatureData = [TMBSignatureSingleton sharedData];
    
    self.creditCard = sharedSignatureData.signature.creditCard;
    self.creditCardNumber.text = self.creditCard.number;
    self.creditCardOperatorNow = self.creditCard.operatorCode;
    
    if (self.creditCard.expiration!=nil) {
        self.creditCardExpirationDatePicker.date = self.creditCard.expiration;
    }

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:YES];
    self.creditCard.number = self.creditCardNumber.text;
    self.creditCard.expiration = self.creditCardExpirationDatePicker.date;
    self.creditCard.operatorCode = self.creditCardOperatorNow;
    sharedSignatureData.signature.creditCard = self.creditCard;
    //NSLog(@"%@",sharedSignatureData.signature.creditCard);

}



@end
