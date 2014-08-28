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
@property (weak, nonatomic) IBOutlet UITextField *creditCardExpirationDateTextField;
@property (weak, nonatomic) IBOutlet UITextView *signatureAdhesionTextView;
@property (weak, nonatomic) IBOutlet UITextField *creditCardNumber;

- (IBAction)submitSignature:(id)sender;

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
    self.creditCardExpirationDateTextField.text = [sharedSignatureData.signature getStringFromDate:self.creditCard.expiration];
    

    UIDatePicker *datePicker =[[UIDatePicker alloc] init];
    datePicker.datePickerMode =UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
    datePicker.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DatePickerView.png"]];
    
    if (self.creditCard.expiration!=nil) {
        datePicker.date = self.creditCard.expiration;
    }
    
    self.creditCardExpirationDateTextField.inputView = datePicker;
    
    UIImage *backgroundImage = [UIImage imageNamed:@"Background.png"];
    self.background.image = backgroundImage;
        // Do any additional setup after loading the view.
}

-(void)updateCreditCardInfo:(NSNotification*)aNotification{
    
    NSLog(@"pssei credit card scaned");

    if ([aNotification.name isEqual:@"CreditCardScaned"]) {
        [self updateText:self.creditCardExpirationDateTextField];
        self.creditCardNumber.text = sharedPaymentData.creditCardInfo.redactedCardNumber;
        self.creditCard.number = sharedPaymentData.creditCardInfo.cardNumber;
        sharedSignatureData.signature.creditCard = self.creditCard;
    }
}

-(void)updateText:(UITextField*)textField{
    
    [UIView animateWithDuration:0.25f
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [textField setAlpha:0];
                     }
                     completion:nil];
    [UIView animateWithDuration:0.25f
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [textField setAlpha:1];
                     }
                     completion:nil];
    
    
}


-(void)datePickerValueChanged:(UIDatePicker*)datePicker{
    
    [self updateText:self.creditCardExpirationDateTextField];
    self.creditCard.expiration = datePicker.date;
    sharedSignatureData.signature.creditCard = self.creditCard;
    self.creditCardExpirationDateTextField.text = [sharedSignatureData.signature getStringFromDate:datePicker.date];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    self.creditCard.number = self.creditCardNumber.text;
    sharedSignatureData.signature.creditCard = self.creditCard;
    [self.view endEditing:YES];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCreditCardInfo:) name:@"CreditCardScaned" object:nil];
    NSLog(@"%@",[[NSNotificationCenter defaultCenter] observationInfo]);
    
}


-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:YES];
    self.creditCard.expiration = [sharedSignatureData.signature getDateFromString:self.creditCardExpirationDateTextField.text];
    sharedSignatureData.signature.creditCard = self.creditCard;

}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (IBAction)submitSignature:(id)sender {
    
    [TMBSignatureSingleton postNewSignature:sharedSignatureData.signature];
}
@end
