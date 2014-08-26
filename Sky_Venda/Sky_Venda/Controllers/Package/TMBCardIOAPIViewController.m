//
//  TMBCardIOAPIViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/25/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBCardIOAPIViewController.h"
#import "CardIO.h"
#import "CardIOViewDelegate.h"
#import "TMBPaymentSingleton.h"

#define CardIOAppToken @"067bbd10b40543008b9326753aef03ab"

@interface TMBCardIOAPIViewController ()<CardIOViewDelegate>


- (IBAction)cancelScan:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *cardIOView;

@end

@implementation TMBCardIOAPIViewController{
    
    TMBPaymentSingleton *sharedPaymentData;

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
    
    sharedPaymentData = [TMBPaymentSingleton sharedData];
    
    CardIOView *cardIOSubView = [[CardIOView alloc] initWithFrame:self.cardIOView.frame];
    
    cardIOSubView.appToken = CardIOAppToken; // get your app token from the card.io website
    cardIOSubView.delegate = self;
    
    [self.cardIOView addSubview:cardIOSubView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)cardIOView:(CardIOView *)cardIOView didScanCard:(CardIOCreditCardInfo *)cardInfo{
    
    if (cardInfo) {
        // The full card number is available as info.cardNumber, but don't log that!
        NSLog(@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", cardInfo.redactedCardNumber, (unsigned long)cardInfo.expiryMonth, (unsigned long)cardInfo.expiryYear, cardInfo.cvv);
        
        sharedPaymentData.creditCardInfo = cardInfo;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CreditCardScaned" object:nil];
        // Use the card info...
    }
    else {
        NSLog(@"User cancelled payment info");
        // Handle user cancellation here...
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancelScan:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
