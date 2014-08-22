//
//  TMBPackageAdhesionViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPackageAdhesionViewController.h"
#import "TMBSignatureSingleton.h"

@interface TMBPackageAdhesionViewController ()

@end

@implementation TMBPackageAdhesionViewController{
    
    TMBSignatureSingleton *sharedSignatureData;
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
    
    NSString *imageName = [NSString stringWithFormat:@"SKY%d.png",sharedSignatureData.signature.package];
    
    self.packagePresentation.image = [UIImage imageNamed:imageName];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)submitPackageSignature:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UIViewController *signatureSubmited = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBSignatureSubmited"];
    [self.navigationController pushViewController:signatureSubmited animated:YES];
    
}
@end
