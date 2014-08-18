//
//  TMBInstallationAdressDataViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBInstallationAdressDataViewController.h"
#define NUMBER_OF_SECTIONS 1
#define NUMBER_OF_ROWS_IN_SECTION_DEFAULT 10

BOOL keyboardShown;
CGFloat keyboardOverlap;

@interface TMBInstallationAdressDataViewController ()
enum TMBTableViewRow:NSInteger{
    
    TMBTableViewRowInstallationAdressCep = 1,
    TMBTableViewRowInstallationAdressCity = 3,
    TMBTableViewRowInstallationAdressState = 4,
    TMBTableViewRowInstallationAdressSector = 5,
    
    TMBTableViewRowInstallationAdressStreet = 6,
    TMBTableViewRowInstallationAdressNumber = 7,
    TMBTableViewRowInstallationAdressComplement = 8,
    
    TMBTableViewRowInstallationAdressNextStepButton = 9,
    TMBTableViewRowInstallationAdressMapView = 0,
    
    TMBTableViewRowInstallationAdressCorreiosWebView = 10,
    TMBTableViewRowInstallationAdressSearchInCorreiosSiteButton = 2,

    
};

@property (nonatomic) NSIndexPath *activeCellIndexPath;


@end

@implementation TMBInstallationAdressDataViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

#pragma mark - TableView

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    return NUMBER_OF_SECTIONS;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return NUMBER_OF_ROWS_IN_SECTION_DEFAULT;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.row) {
        case TMBTableViewRowInstallationAdressCep:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"CEP";
            cell.textField.placeholder = @"Cep do endereço de instalação";
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            self.installationAdressCep = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressCity:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Cidade";
            cell.textField.placeholder = @"Cidade do endereço de instalação";
            cell.textField.keyboardType = UIKeyboardTypeDefault;
            self.installationAdressCity = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressState:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Estado";
            cell.textField.placeholder = @"Estado do endereço de instalação";
            cell.textField.keyboardType = UIKeyboardTypeDefault;
            self.installationAdressState = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressSector:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Bairro";
            cell.textField.placeholder = @"Bairro do endereço de instalação";
            cell.textField.keyboardType = UIKeyboardTypeDefault;
            self.installationAdressSector = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressStreet:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Rua";
            cell.textField.placeholder = @"Rua do endereço de instalação";
            cell.textField.keyboardType = UIKeyboardTypeDefault;
            self.installationAdressStreet = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressNumber:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Número";
            cell.textField.placeholder = @"Número do endereço de instalação";
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            self.installationAdressNumber = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressComplement:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Complemento";
            cell.textField.placeholder = @"Complemento do endereço de instalação";
            cell.textField.keyboardType = UIKeyboardTypeDefault;
            self.installationAdressComplement = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressMapView:{
            TMBMapGetLocationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MapViewCell" forIndexPath:indexPath];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressNextStepButton:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NextStepTableViewCell" forIndexPath:indexPath];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressSearchInCorreiosSiteButton:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchInCorreiosButtonCell" forIndexPath:indexPath];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressCorreiosWebView:{
            UITableViewCell *cell;
            return cell;
            break;
        }
        default:
            return nil;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.row) {
            case TMBTableViewRowInstallationAdressMapView:
                case TMBTableViewRowInstallationAdressCorreiosWebView:
                    return 350;
            break;
            case TMBTableViewRowInstallationAdressSearchInCorreiosSiteButton:
                case TMBTableViewRowInstallationAdressNextStepButton:
                    return 45;
            break;
        default:
            return 55;
            break;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.installationAdressCep.text = [[TMBSignatureData sharedData] installationAdressCep];
    
}


#pragma mark - Navigation
- (IBAction)nextStep:(id)sender {
    
    [[TMBSignatureData sharedData] setInstallationAdressCep:self.installationAdressCep.text];
    [[TMBSignatureData sharedData] setInstallationAdressCity:self.installationAdressCity.text];
    [[TMBSignatureData sharedData] setInstallationAdressState:self.installationAdressState.text];
    [[TMBSignatureData sharedData] setInstallationAdressSector:self.installationAdressSector.text];
    [[TMBSignatureData sharedData] setInstallationAdressStreet:self.installationAdressStreet.text];
    [[TMBSignatureData sharedData] setInstallationAdressNumber:self.installationAdressNumber.text];
    [[TMBSignatureData sharedData] setInstallationAdressComplement:self.installationAdressComplement.text];
    
    /*
     NSLog(@"%@",[[TMBSignatureData sharedData] installationAdressCep]);
     NSLog(@"%@",[[TMBSignatureData sharedData] installationAdressCity]);
     NSLog(@"%@",[[TMBSignatureData sharedData] installationAdressState]);
     NSLog(@"%@",[[TMBSignatureData sharedData] installationAdressSector]);
     NSLog(@"%@",[[TMBSignatureData sharedData] installationAdressStreet]);
     NSLog(@"%@",[[TMBSignatureData sharedData] installationAdressNumber]);
     NSLog(@"%@",[[TMBSignatureData sharedData] installationAdressComplement]);
     */

    
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    TMBPaymentDataViewController *clientData = segue.destinationViewController;
    
    clientData.packagePresentationImage = self.packagePresentationImage;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    
    if(keyboardShown)
        return;
    
    keyboardShown = YES;
    
    // Get the keyboard size
    UIScrollView *tableView;
    if([self.installationAdressDataTableView.superview isKindOfClass:[UIScrollView class]])
        tableView = (UIScrollView *)self.installationAdressDataTableView.superview;
    else
        tableView = self.installationAdressDataTableView;
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [tableView.superview convertRect:[aValue CGRectValue] fromView:nil];
    
    // Get the keyboard's animation details
    NSTimeInterval animationDuration;
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    UIViewAnimationCurve animationCurve;
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    
    // Determine how much overlap exists between tableView and the keyboard
    CGRect tableFrame = tableView.frame;
    CGFloat tableLowerYCoord = tableFrame.origin.y + tableFrame.size.height;
    keyboardOverlap = tableLowerYCoord - keyboardRect.origin.y;
    if(self.inputAccessoryView && keyboardOverlap>0)
    {
        CGFloat accessoryHeight = self.inputAccessoryView.frame.size.height;
        keyboardOverlap -= accessoryHeight;
        
        tableView.contentInset = UIEdgeInsetsMake(0, 0, accessoryHeight, 0);
        tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, accessoryHeight, 0);
    }
    
    if(keyboardOverlap < 0)
        keyboardOverlap = 0;
    
    if(keyboardOverlap != 0)
    {
        tableFrame.size.height -= keyboardOverlap;
        
        NSTimeInterval delay = 0;
        if(keyboardRect.size.height)
        {
            delay = (1 - keyboardOverlap/keyboardRect.size.height)*animationDuration;
            animationDuration = animationDuration * keyboardOverlap/keyboardRect.size.height;
        }
        
        [UIView animateWithDuration:animationDuration delay:delay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{ tableView.frame = tableFrame; }
                         completion:^(BOOL finished){ [self tableAnimationEnded:nil finished:nil contextInfo:nil]; }];
    }
}

- (void)keyboardWillHide:(NSNotification *)aNotification
{
    
    if(!keyboardShown)
        return;
    
    keyboardShown = NO;
    
    UIScrollView *tableView;
    if([self.installationAdressDataTableView.superview isKindOfClass:[UIScrollView class]])
        tableView = (UIScrollView *)self.installationAdressDataTableView.superview;
    else
        tableView = self.installationAdressDataTableView;
    if(self.inputAccessoryView)
    {
        tableView.contentInset = UIEdgeInsetsZero;
        tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
    }
    
    if(keyboardOverlap == 0)
        return;
    
    // Get the size & animation details of the keyboard
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [tableView.superview convertRect:[aValue CGRectValue] fromView:nil];
    
    NSTimeInterval animationDuration;
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    UIViewAnimationCurve animationCurve;
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    
    CGRect tableFrame = tableView.frame;
    tableFrame.size.height += keyboardOverlap;
    
    if(keyboardRect.size.height)
        animationDuration = animationDuration * keyboardOverlap/keyboardRect.size.height;
    
    [UIView animateWithDuration:animationDuration delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{ tableView.frame = tableFrame; }
                     completion:nil];
}

- (void) tableAnimationEnded:(NSString*)animationID finished:(NSNumber *)finished contextInfo:(void *)context
{
    // Scroll to the active cell
    if(self.activeCellIndexPath)
    {
        [self.installationAdressDataTableView scrollToRowAtIndexPath:self.activeCellIndexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        
        [self.installationAdressDataTableView selectRowAtIndexPath:self.activeCellIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
}
@end