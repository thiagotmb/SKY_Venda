//
//  TMBClientDataViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBClientDataViewController.h"
#define NUMBER_OF_SECTIONS 1
#define NUMBER_OF_ROWS_IN_SECTION_DEFAULT 9
BOOL keyboardShown;
CGFloat keyboardOverlap;
@interface TMBClientDataViewController ()

enum TMBTableViewRow:NSInteger{
  
    TMBTableViewRowClientName = 0,
    TMBTableViewRowClientGender = 1,
    TMBTableViewRowClientRg = 2,
    TMBTableViewRowClientCpf = 3,
    
    TMBTableViewRowClientSocialReason = 4,
    TMBTableViewRowClientEmail = 5,
    TMBTableViewRowClientPhoneNumber = 6,
    TMBTableViewRowClientBirthDate = 7,

    TMBTableViewRowNextSepButton = 8,


    
    
};

@property (nonatomic) NSIndexPath *activeCellIndexPath;

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
     
     NSString *imageName = [NSString stringWithFormat:@"SKY%@.png",[[TMBSignatureData sharedData] selectedPackage]];
     
    self.packagePresentation.image = [UIImage imageNamed:imageName];

    self.packagePresentation.image = [UIImage imageNamed:imageName];

    // Do any additional setup after loading the view.
    self.genderPickerData = @[@"Masculino",@"Feminino"];
    self.socialReasonPickerData = @[@"Solteiro",@"Casado",@"Outros"];

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
        case TMBTableViewRowClientName:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Nome";
            cell.textField.placeholder = @"Nome completo como consta no CPF";
            self.clientName = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowClientCpf:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"CPF";
            cell.textField.placeholder = @"CPF relativo ao nome acima";
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            self.clientCpf = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowClientRg:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"RG";
            cell.textField.placeholder = @"RG";
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            self.clientRg = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowClientEmail:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"E-Mail";
            cell.textField.placeholder = @"E-Mail para contato";
            cell.textField.keyboardType = UIKeyboardTypeEmailAddress;
            self.clientEmail = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowClientPhoneNumber:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Telefone";
            cell.textField.placeholder = @"Telefone para contato";
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            self.clientPhoneNumber = cell.textField;
            return cell;
            break;
        }
        case TMBTableViewRowClientGender:{
            TMBPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PickerCell" forIndexPath:indexPath];
            cell.pickerView.delegate = cell;
            cell.pickerView.dataSource = cell;
            cell.titleLabel.text = @"Sexo";
            cell.pickerData = self.genderPickerData;
            cell.numberOfComponentsInPickerView = 1;
            self.genderPickerView = cell.pickerView;
            
            return cell;
            break;
        }
        case TMBTableViewRowClientSocialReason:{
            TMBPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PickerCell" forIndexPath:indexPath];
            cell.pickerView.delegate = cell;
            cell.pickerView.dataSource = cell;
            cell.titleLabel.text = @"Razão Social";
            cell.pickerData = self.socialReasonPickerData ;
            cell.numberOfComponentsInPickerView = 1;
            self.socialReasonPickerView = cell.pickerView;
            
            return cell;
            break;
        }
        case TMBTableViewRowClientBirthDate:{
            TMBDatePickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DatePickerCell" forIndexPath:indexPath];
            self.birthDatePickerView = cell.datePickerView;
            return cell;
            break;
        }
        case TMBTableViewRowNextSepButton:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NextStepTableViewCell" forIndexPath:indexPath];
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
        case TMBTableViewRowClientSocialReason:
            return 80;
            break;
        case TMBTableViewRowClientGender:
            return 60;
            break;
            case TMBTableViewRowClientBirthDate:
            return 160;
            break;
        default:
            return 50;
            break;
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    self.clientName.text = [[TMBSignatureData sharedData] clientName];
    self.clientCpf.text = [[TMBSignatureData sharedData] clientCpf];
    self.clientRg.text = [[TMBSignatureData sharedData] clientRg];
    self.clientEmail.text = [[TMBSignatureData sharedData] clientEmail];
    self.clientPhoneNumber.text = [[TMBSignatureData sharedData] clientPhoneNumber];

}

#pragma mark - Navigation

- (IBAction)nextStep:(id)sender {
    
    [[TMBSignatureData sharedData] setClientName:self.clientName.text];
    [[TMBSignatureData sharedData] setClientCpf:self.clientCpf.text];
    [[TMBSignatureData sharedData] setClientRg:self.clientRg.text];
    [[TMBSignatureData sharedData] setClientEmail:self.clientEmail.text];
    [[TMBSignatureData sharedData] setClientPhoneNumber:self.clientPhoneNumber.text];
    
    NSInteger genderRow = [self.genderPickerView selectedRowInComponent:0];
    NSString *selectedGender = [self.genderPickerData objectAtIndex:genderRow];
    [[TMBSignatureData sharedData] setClientGender:selectedGender];
    
    NSInteger socialReasonRow = [self.socialReasonPickerView selectedRowInComponent:0];
    NSString *selectedSocialReason = [self.socialReasonPickerData objectAtIndex:socialReasonRow];
    [[TMBSignatureData sharedData] setClientSocialReason:selectedSocialReason];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString;
    dateString = [dateFormat stringFromDate:self.birthDatePickerView.date];
    [[TMBSignatureData sharedData] setClientBirthDate:dateString];
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TMBInstallationAdressDataViewController *installationAdressDataViewController = (TMBInstallationAdressDataViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBInstallationAdressDataViewController"];
    [self.navigationController pushViewController:installationAdressDataViewController animated:YES];
    /*
    NSLog(@"Nome %@",[[TMBSignatureData sharedData] clientName]);
    NSLog(@"CPF %@",[[TMBSignatureData sharedData] clientCpf]);
    NSLog(@"RG %@",[[TMBSignatureData sharedData] clientRg]);
    NSLog(@"Email %@",[[TMBSignatureData sharedData] clientEmail]);
    NSLog(@"Telefone %@",[[TMBSignatureData sharedData] clientPhoneNumber]);
    NSLog(@"%@",[[TMBSignatureData sharedData] clientGender]);
    NSLog(@"%@",[[TMBSignatureData sharedData] clientSocialReason]);
    NSLog(@"%@",[[TMBSignatureData sharedData] clientBirthDate]);
    */
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    
    if(keyboardShown)
        return;
    
    keyboardShown = YES;
    
    // Get the keyboard size
    UIScrollView *tableView;
    if([self.clientDataTableView.superview isKindOfClass:[UIScrollView class]])
        tableView = (UIScrollView *)self.clientDataTableView.superview;
    else
        tableView = self.clientDataTableView;
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
    if([self.clientDataTableView.superview isKindOfClass:[UIScrollView class]])
        tableView = (UIScrollView *)self.clientDataTableView.superview;
    else
        tableView = self.clientDataTableView;
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
        [self.clientDataTableView scrollToRowAtIndexPath:self.activeCellIndexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        
        [self.clientDataTableView selectRowAtIndexPath:self.activeCellIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
}



@end
