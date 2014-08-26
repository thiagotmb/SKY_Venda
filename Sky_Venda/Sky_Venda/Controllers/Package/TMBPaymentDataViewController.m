//
//  TMBPaymentDataViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPaymentDataViewController.h"
#import "TMBCreditCard.h"
#import "TMBPaymentSingleton.h"


@interface TMBPaymentDataViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UILabel *maskLabel;

@end

@implementation TMBPaymentDataViewController{
    
    TMBSignatureSingleton *sharedSignatureData;
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
    sharedSignatureData = [TMBSignatureSingleton sharedData];
    sharedPaymentData = [TMBPaymentSingleton sharedData];

    self.creditCard = sharedSignatureData.signature.creditCard;
    self.creditCardNumber.text = self.creditCard.number;
    self.creditCardOperatorNow = self.creditCard.operatorCode;
    
    if (self.creditCard.expiration!=nil) {
        self.creditCardExpirationDatePicker.date = self.creditCard.expiration;
    }

    UIImage *backgroundImage = [UIImage imageNamed:@"Background.png"];
    self.background.image = backgroundImage;
    
    [self.maskLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Label.png"]]];
    // Do any additional setup after loading the view.
}

-(void)updateCreditCardInfo:(NSNotification*)aNotification{
    

    if ([aNotification.name isEqual:@"CreditCardScaned"]) {
        self.creditCardNumber.text = sharedPaymentData.creditCardInfo.redactedCardNumber;
        self.creditCard.number = sharedPaymentData.creditCardInfo.cardNumber;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCreditCardInfo:) name:@"CreditCardScaned" object:nil];
    
    
}


-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:YES];
    self.creditCard.expiration = self.creditCardExpirationDatePicker.date;
    self.creditCard.operatorCode = self.creditCardOperatorNow;
    sharedSignatureData.signature.creditCard = self.creditCard;
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
