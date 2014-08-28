//
//  TMBClientDataViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/11/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBClientDataViewController.h"
#import "TMBSignatureSingleton.h"
#import "TMBClient.h"

#define NUMBER_OF_SECTIONS 1
#define NUMBER_OF_ROWS_IN_SECTION_DEFAULT 9


@interface TMBClientDataViewController ()

@property (nonatomic) NSIndexPath *activeCellIndexPath;
@property (weak, nonatomic) IBOutlet UIImageView *background;

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

@end

@implementation TMBClientDataViewController{
    
    TMBSignatureSingleton *sharedSignatureData;
    BOOL keyboardShown;
    CGFloat keyboardOverlap;
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
    self.client = sharedSignatureData.signature.client;
    
    self.packagePresentation.image = sharedSignatureData.signature.package.mainImage;

    // Do any additional setup after loading the view.
    self.genderPickerData = @[@"Masculino",@"Feminino"];
    self.socialReasonPickerData = @[@"Solteiro",@"Casado",@"Outros"];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"Background.png"];
    self.background.image = backgroundImage;
   
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
            cell.textField.text = self.client.name;
            cell.textField.keyboardType = UIKeyboardTypeDefault;
            cell.textField.tag = TMBClientNameTextFieldTag;
            cell.textField.inputView = nil;
            [cell updateLabel];
            return cell;
            break;
        }
        case TMBTableViewRowClientCpf:{
            
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"CPF";
            cell.textField.placeholder = @"CPF relativo ao nome acima";
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            cell.textField.inputView = nil;

            cell.textField.text = self.client.cpf;
            cell.textField.tag = TMBClientCpfTextFieldTag;
            
            [cell updateLabel];

            return cell;
            
            
        }
        case TMBTableViewRowClientRg:{
            
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"RG";
            cell.textField.placeholder = @"RG";
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            cell.textField.text = self.client.rg;
            cell.textField.tag = TMBClientRgTextFieldTag;
            cell.textField.inputView = nil;
            [cell updateLabel];
            return cell;
            
        }
        case TMBTableViewRowClientEmail:{
            
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"E-Mail";
            cell.textField.placeholder = @"E-Mail para contato";
            cell.textField.keyboardType = UIKeyboardTypeEmailAddress;
            cell.textField.text = self.client.email;
            cell.textField.tag = TMBClientEmailTextFieldTag;
            cell.textField.inputView = nil;
            [cell updateLabel];
            return cell;
            
        }
        case TMBTableViewRowClientPhoneNumber:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"
                                                                              forIndexPath:indexPath];
            
            cell.titleLabel.text = @"Telefone";
            cell.textField.placeholder = @"Telefone para contato";
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            cell.textField.text = self.client.phoneNumber;
            cell.textField.tag = TMBClientPhoneNumberTextFieldTag;
            cell.textField.inputView = nil;
            [cell updateLabel];
            return cell;
            break;
        }
        case TMBTableViewRowClientGender:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"
                                                                           forIndexPath:indexPath];
            cell.textField.tag = TMBClientGenderPickerTag;
            cell.titleLabel.text = @"Sexo";
            cell.textField.placeholder = @"Sexo";
            cell.pickerData = self.genderPickerData ;
            cell.numberOfComponentsInPickerView = 1;
            
            UIPickerView* pickerView = [[UIPickerView alloc] init];
            pickerView.delegate = cell;
            pickerView.dataSource = cell;
            [pickerView selectRow:self.client.gender inComponent:0 animated:YES];
            pickerView.tag = TMBClientGenderPickerTag;
            if (self.genderPickerData[self.client.gender]!=nil) {
                cell.textField.text = self.genderPickerData[self.client.gender];

            }
            pickerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PickerView.png"]];

            [pickerView setFrame:CGRectMake(pickerView.frame.origin.x, pickerView.frame.origin.y, pickerView.frame.size.width, pickerView.frame.size.height/2)];
            cell.textField.inputView = pickerView;
            [cell updateLabel];

            return cell;
            break;
        }
        case TMBTableViewRowClientSocialReason:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"
                                                                           forIndexPath:indexPath];
            cell.textField.tag = TMBClientSocialReasonPickerTag;
            cell.titleLabel.text = @"Razão Social";
            cell.textField.placeholder = @"Razão social";
            cell.pickerData = self.socialReasonPickerData ;
            cell.numberOfComponentsInPickerView = 1;
            
            UIPickerView* pickerView = [[UIPickerView alloc] init];
            pickerView.delegate = cell;
            pickerView.dataSource = cell;
            [pickerView selectRow:self.client.socialReason inComponent:0 animated:YES];
            pickerView.tag = TMBClientSocialReasonPickerTag;
            if (self.socialReasonPickerData[self.client.socialReason]!=nil) {
                pickerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PickerView.png"]];
                
                [pickerView setFrame:CGRectMake(pickerView.frame.origin.x, pickerView.frame.origin.y, pickerView.frame.size.width, pickerView.frame.size.height/2)];
            cell.textField.text = self.socialReasonPickerData[self.client.socialReason];
            }
            cell.textField.inputView = pickerView;
            [cell updateLabel];

            
            return cell;
            break;
        }
        case TMBTableViewRowClientBirthDate:{
            TMBTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"
                                                                forIndexPath:indexPath];
            cell.textField.tag = TMBClientBirhDatePickerTag;
            cell.titleLabel.text = @"Nascimento";
            cell.textField.placeholder = @"Data de nascimento";
            
            UIDatePicker *datePicker =[[UIDatePicker alloc] init];
            datePicker.datePickerMode =UIDatePickerModeDate;
            [datePicker addTarget:cell action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
            datePicker.tag = TMBClientBirhDatePickerTag;
            datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
            datePicker.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DatePickerView.png"]];
           
            if (self.client.birthDate!=nil) {
                datePicker.date = self.client.birthDate;
            }
            cell.textField.keyboardAppearance = UIKeyboardAppearanceDefault;
            cell.textField.inputView = datePicker;
            cell.textField.text = [sharedSignatureData.signature getStringFromDate:self.client.birthDate];
            [cell updateLabel];


            return cell;
            break;
        }
        case TMBTableViewRowNextSepButton:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NextStepTableViewCell"
                                                                    forIndexPath:indexPath];
            return cell;
            break;
        }
        default:
            return nil;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}



-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    sharedSignatureData.signature.client = self.client;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //NSLog(@"%@",sharedSignatureData.signature.client);

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
            animationDuration = 2*  animationDuration * keyboardOverlap/keyboardRect.size.height;
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
        animationDuration = 2* animationDuration * keyboardOverlap/keyboardRect.size.height;
    
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
