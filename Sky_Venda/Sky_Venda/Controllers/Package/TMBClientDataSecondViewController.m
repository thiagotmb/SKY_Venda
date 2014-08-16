//
//  TMBClientDataSecondViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBClientDataSecondViewController.h"

@interface TMBClientDataSecondViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeigth;
@property (nonatomic) NSArray *socialReasonPickerData;
@end

@implementation TMBClientDataSecondViewController

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
    // Do any additional setup after loading the view.
    
    self.birthDatePickerView.datePickerMode = UIDatePickerModeDate;
    
    if (self.view.bounds.size.height == 1024) {
        NSLog(@"passei");
        //self.imageHeigth.constant = 600 ;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    TMBClientDataThirdViewController *clientData = segue.destinationViewController;
    
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

- (IBAction)nextStep:(id)sender {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString;
    dateString = [dateFormat stringFromDate:self.birthDatePickerView.date];
    [[TMBSignatureData sharedData] setClientBirthDate:dateString];
    
   // NSLog(@"%@",[[TMBSignatureData sharedData] clientBirthDate]);
    
}
@end
