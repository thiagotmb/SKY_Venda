//
//  TMBAdhesionViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 9/3/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBAdhesionViewController.h"

@interface TMBAdhesionViewController ()


@property (weak, nonatomic) IBOutlet UIWebView *adhesionWebView;
- (IBAction)dismiss:(id)sender;

@end

@implementation TMBAdhesionViewController

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
    
    self.adhesionWebView.delegate = self;
    [self.adhesionWebView setHidden:NO];
    
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.adhesionWebView loadRequest:request];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]];
    
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

- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
