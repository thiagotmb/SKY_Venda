//
//  TMBPaymentDataViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPaymentDataViewController.h"

#define NUMBER_OF_COMPONENTS_IN_PICKERVIEW 2
#define MONTH_PICKER_COMPONENT 0
#define YEAR_PICKER_COMPONENT 1

@interface TMBPaymentDataViewController ()
@property (nonatomic) NSArray *creditCardExpirationDatePickerMonthData;
@property (nonatomic) NSArray *creditCardExpirationDatePickerYearData;

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
    
    self.creditCardExpirationDatePicker.dataSource = self;
    self.creditCardExpirationDatePicker.delegate = self;
    self.creditCardExpirationDatePickerMonthData = @[@"DEZEMBRO",@"NOVEMBRO"];
    self.creditCardExpirationDatePickerYearData = @[@"2015",@"2016"];
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
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return NUMBER_OF_COMPONENTS_IN_PICKERVIEW;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    switch (component) {
        case MONTH_PICKER_COMPONENT:
            return  self.creditCardExpirationDatePickerMonthData.count;
            break;
        case YEAR_PICKER_COMPONENT:
            return self.creditCardExpirationDatePickerYearData.count;
            break;
        default:
            return 0;
            break;
    }
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    switch (component) {
        case MONTH_PICKER_COMPONENT:
            return self.creditCardExpirationDatePickerMonthData[row];
            break;
        case YEAR_PICKER_COMPONENT:
            return self.creditCardExpirationDatePickerYearData[row];
            break;
            
        default:
            return nil;
            break;
    }
    
}

- (IBAction)nextStep:(id)sender {
    
    
    [[TMBSignatureData sharedData] setCreditCardNumber:[NSString stringWithFormat:@"%@",self.creditCardNumber.text]];
    
    
    NSInteger creditCardExpirationDateMonthSelectedRow = [self.creditCardExpirationDatePicker selectedRowInComponent:MONTH_PICKER_COMPONENT];
    NSString* creditCardExpirationDateMonthString = [NSString stringWithFormat:@"%@",self.creditCardExpirationDatePickerMonthData[creditCardExpirationDateMonthSelectedRow]];
    NSInteger creditCardExpirationDateYearSelectedRow = [self.creditCardExpirationDatePicker selectedRowInComponent:YEAR_PICKER_COMPONENT];
    NSString* creditCardExpirationDateYearString = [NSString stringWithFormat:@"%@",self.creditCardExpirationDatePickerYearData[creditCardExpirationDateYearSelectedRow]];
    
    NSString* creditCartExpirationDateString = [NSString stringWithFormat:@"%@-%@",creditCardExpirationDateMonthString,creditCardExpirationDateYearString];
    
    [[TMBSignatureData sharedData] setCreditExpirationDate:creditCartExpirationDateString];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TMBPackageAdhesionViewController *packageAdhesionViewController = (TMBPackageAdhesionViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBPackageAdhesionViewController"];
    [self.navigationController pushViewController:packageAdhesionViewController animated:YES];
    
    /*
    NSLog(@"%@",[[TMBSignatureData sharedData] creditCardNumber]);
    NSLog(@"%@",[[TMBSignatureData sharedData] creditExpirationDate]);
     */

}

@end
