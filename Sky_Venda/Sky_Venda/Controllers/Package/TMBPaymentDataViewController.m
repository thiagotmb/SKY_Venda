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
#import "TMBAdhesionViewController.h"


@interface TMBPaymentDataViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UITextField *creditCardExpirationDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *creditCardNumber;

@property (nonatomic) UIDatePicker* datePicker;

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
    
    self.datePicker =[[UIDatePicker alloc] init];
    self.datePicker.datePickerMode =UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.datePicker.frame.origin.x, self.datePicker.frame.origin.y, self.datePicker.frame.size.width/5,self.datePicker.frame.size.height) ];
    [label setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DatePickerView.png"]]];
    [self.datePicker addSubview:label];
    self.datePicker.viewForBaselineLayout.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DatePickerView.png"]];
    self.datePicker.minimumDate = [NSDate date];
    self.creditCardExpirationDateTextField.inputView = self.datePicker;
    self.creditCardExpirationDateTextField.keyboardAppearance = UIKeyboardAppearanceDefault;
    
    if (self.creditCard.expiration!=nil) {
        self.datePicker.date = self.creditCard.expiration;
    }
    
    
    UIImage *backgroundImage = [UIImage imageNamed:@"Background.png"];
    self.background.image = backgroundImage;
    
    // Do any additional setup after loading the view.
}


-(void)updateCreditCardInfo:(NSNotification*)aNotification{
    

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
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/yyyy"];
    NSString *dateString;
    dateString = [dateFormat stringFromDate:datePicker.date];
    
    self.creditCardExpirationDateTextField.text = dateString;
    
    
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender{

    
    if ([[segue identifier] isEqualToString:@"pushAdhesionViewController"]) {
        
        switch (sender.tag) {
            case 0:{
                TMBAdhesionViewController *segueViewController = [segue destinationViewController];
                segueViewController.urlString = @"https://a248.e.akamai.net/f/248/16140/2d/www1.sky.com.br/akamai/assine/doc/Politica_de_Prividade_SKY%20_%20Assine%20SKY_%2018%2006%202014%20_versao_limpa.pdf";

            }
                break;
            case 1:{
                NSLog(@"passei");
                TMBAdhesionViewController *segueViewController = [segue destinationViewController];
                segueViewController.urlString = @"https://a248.e.akamai.net/f/248/16140/7d/www1.sky.com.br/akamai/assine/pdf/Condicoes-gerais.pdf";
            }
                break;
            default:
                break;
        }
            

        }

}




@end
