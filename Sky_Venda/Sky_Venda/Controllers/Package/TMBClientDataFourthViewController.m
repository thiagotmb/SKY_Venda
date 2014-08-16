//
//  TMBClientDataFourthViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBClientDataFourthViewController.h"

@interface TMBClientDataFourthViewController ()

@end

@implementation TMBClientDataFourthViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    TMBClientDataFifthViewController *clientData = segue.destinationViewController;
    
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

- (IBAction)getMyLocation:(id)sender {
}

- (IBAction)nextStep:(id)sender {
    
    [[TMBSignatureData sharedData] setInstallationAdressCep:self.installationAdressCep.text];
    
    NSLog(@"%@",[[TMBSignatureData sharedData] installationAdressCep]);
    
}


@end
