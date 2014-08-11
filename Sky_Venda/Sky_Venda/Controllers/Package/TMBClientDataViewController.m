//
//  TMBClientDataViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBClientDataViewController.h"
#define NUMBEROFCOMPONENTSINPICKERVIEW 1

@interface TMBClientDataViewController ()
@property (nonatomic) NSArray *genderPickerData;
@property (nonatomic) NSArray *socialReasonPickerData;


@end

@implementation TMBClientDataViewController

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
    self.packagePresentation.image = self.packagePresentationImage;
    
    self.genderPickerData = @[@"Masculino",@"Feminino"];
    self.genderPickerView.dataSource = self;
    self.genderPickerView.delegate = self;
    
    self.socialReasonPickerData = @[@"Solteiro",@"Casado"];
    self.socialReasonPickerView.dataSource = self;
    self.socialReasonPickerView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return NUMBEROFCOMPONENTSINPICKERVIEW;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    switch (pickerView.tag) {
        case 0:
            return self.genderPickerData.count;
            break;
        case 1:
            return self.socialReasonPickerData.count;
            break;
        default:
            return 0;
            break;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    switch (pickerView.tag) {
        case 0:
            return self.genderPickerData[row];
            break;
        case 1:
            return self.socialReasonPickerData[row];
            break;
        default:
            return nil;
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    TMBClientDataSecondViewController *clientData = segue.destinationViewController;
    
    clientData.packagePresentationImage = self.packagePresentationImage;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
