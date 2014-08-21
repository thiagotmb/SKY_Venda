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

@implementation TMBPaymentDataViewController

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
    
    self.creditCard = [[TMBCreditCard alloc] init];
    
    self.creditCardNumber.text = self.creditCard.number;
    self.creditCardOperatorNow = self.creditCard.operatorCode;
    self.creditCardExpirationDatePicker.date = self.creditCard.expiration;
    
    self.creditCardOperatorNow = [[[TMBSignatureData sharedData] creditCardOperator] integerValue];
    self.creditCardNumber.text = [[TMBSignatureData sharedData] creditCardNumber];
    //self.creditCardExpirationDatePicker.date = [[TMBSignatureData sharedData] creditExpirationDate];

    
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

- (IBAction)nextStep:(id)sender {
    
    self.creditCard.number = self.creditCardNumber.text;
    self.creditCard.expiration = self.creditCardExpirationDatePicker.date;
    self.creditCard.operatorCode = self.creditCardOperatorNow;
    
    [[TMBSignatureData sharedData] setCreditCardNumber:[NSString stringWithFormat:@"%@",self.creditCardNumber.text]];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM"];
    NSString *dateString;
    dateString = [dateFormat stringFromDate:self.creditCardExpirationDatePicker.date];
    [[TMBSignatureData sharedData] setCreditExpirationDate:dateString];

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TMBPackageAdhesionViewController *packageAdhesionViewController = (TMBPackageAdhesionViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBPackageAdhesionViewController"];
    [self.navigationController pushViewController:packageAdhesionViewController animated:YES];
    
    /*
    NSLog(@"%@",[[TMBSignatureData sharedData] creditCardNumber]);
    NSLog(@"%@",[[TMBSignatureData sharedData] creditExpirationDate]);
     */

}

@end
