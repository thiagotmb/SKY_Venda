//
//  TMBClientDataThirdViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/12/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBClientDataThirdViewController.h"
#define NUMBER_OF_COMPONENTS_IN_PICKERVIEW 1
#define GENDER_PICKER_TAG 0
#define SOCIALREASON_PICKER_TAG 1


@interface TMBClientDataThirdViewController ()
@property (nonatomic) NSArray *genderPickerData;
@property (nonatomic) NSArray *socialReasonPickerData;
@end

@implementation TMBClientDataThirdViewController

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
    // Do any additional setup after loading the view.
    self.packagePresentation.image = self.packagePresentationImage;
    
    self.genderPickerData = @[@"Masculino",@"Feminino"];
    self.genderPickerView.dataSource = self;
    self.genderPickerView.delegate = self;
    
    self.socialReasonPickerData = @[@"Solteiro",@"Casado",@"Outros"];
    self.socialReasonPickerView.dataSource = self;
    self.socialReasonPickerView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return NUMBER_OF_COMPONENTS_IN_PICKERVIEW;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    switch (pickerView.tag) {
        case GENDER_PICKER_TAG:
            return self.genderPickerData.count;
            break;
        case SOCIALREASON_PICKER_TAG:
            return self.socialReasonPickerData.count;
            break;
        default:
            return 0;
            break;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    switch (pickerView.tag) {
        case GENDER_PICKER_TAG:
            return self.genderPickerData[row];
            break;
        case SOCIALREASON_PICKER_TAG:
            return self.socialReasonPickerData[row];
            break;
        default:
            return nil;
            break;
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    TMBClientDataFourthViewController *clientData = segue.destinationViewController;
    
    clientData.packagePresentationImage = self.packagePresentationImage;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)nextStep:(id)sender {
    
    NSInteger socialReasonRow = [self.socialReasonPickerView selectedRowInComponent:0];
    NSString *selectedSocialReason = [self.socialReasonPickerData objectAtIndex:socialReasonRow];
    [[TMBSignatureData sharedData] setClientSocialReason:selectedSocialReason];
    
    NSInteger genderRow = [self.genderPickerView selectedRowInComponent:0];
    NSString *selectedGender = [self.genderPickerData objectAtIndex:genderRow];
    [[TMBSignatureData sharedData] setClientGender:selectedGender];
   
    /*
    NSLog(@"%@",[[TMBSignatureData sharedData] clientGender]);
    NSLog(@"%@",[[TMBSignatureData sharedData] clientSocialReason]);
    */
    
}
@end
