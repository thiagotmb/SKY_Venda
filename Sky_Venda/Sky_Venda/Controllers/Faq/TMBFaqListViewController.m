//
//  TMBFaqListViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBFaqListViewController.h"
#import "TMBFaqSingleton.h"
#import "TMBFaq.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1


@interface TMBFaqListViewController ()

@property (nonatomic,strong) TMBFaq *faqItem;
- (IBAction)requestPhoneContact:(id)sender;
- (IBAction)requestWhatsappContact:(id)sender;
- (IBAction)requestEmailContact:(id)sender;
@property (nonatomic) NSString* alertTitle;
@property (nonatomic) UIAlertView* alertView;
@property (nonatomic) UITextField* contactField;

@property (nonatomic) UIRefreshControl* refreshControl;

@end

@implementation TMBFaqListViewController{
    
    TMBFaqSingleton *sharedFaqList;
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
    sharedFaqList = [TMBFaqSingleton sharedData];
    
    self.faqList = sharedFaqList.faqList;
    
    self.faqItem = sharedFaqList.faqItem;
    
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]];
    
    
    self.alertView = [[UIAlertView alloc] initWithTitle:self.alertTitle message:nil delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Solicitar",nil];
    self.alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(requestFaqList) forControlEvents:UIControlEventValueChanged];
    

    
    
    // Do any additional setup after loading the view.
}

-(void)requestFaqList{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopRefresh:) name:@"DataRecieved" object:nil];
    
    [sharedFaqList requestFaqList];
    
}

-(void)stopRefresh:(NSNotification*)aNotification{

    
    if ([[aNotification.userInfo valueForKey:@"Connection"] isEqualToString:@"Sucess"]) {
        [self.refreshControl endRefreshing];
        self.faqList = sharedFaqList.faqList;
        [self.tableView reloadData];
    }else{
        
        NSLog(@"error");
    }
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.faqList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TMBFaqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FaqCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    self.faqItem = self.faqList[indexPath.row];
    cell.question.text = self.faqItem.question;
    
    
    return cell;
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
    sharedFaqList.faqItem = [self.faqList objectAtIndex:indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TMBFaqAnswerViewController *clientDataViewController = (TMBFaqAnswerViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBFaqAnswerViewController"];
    
    [self.navigationController pushViewController:clientDataViewController animated:YES];
    
    return indexPath;
}

- (IBAction)requestPhoneContact:(id)sender {
    
    self.alertTitle = @"Telefone para contato";
    self.alertView.title = self.alertTitle;
    
    UITextField *textField = [self.alertView textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.keyboardAppearance = UIKeyboardAppearanceDark;
    
    [self.alertView show];
    
    NSLog(@"passei");
}

- (IBAction)requestWhatsappContact:(id)sender {
    
    self.alertTitle = @"Whatsapp para contato";
    self.alertView.title = self.alertTitle;
    
    UITextField *textField = [self.alertView textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.keyboardAppearance = UIKeyboardAppearanceDark;
    
    [self.alertView show];
    
}

- (IBAction)requestEmailContact:(id)sender {
    
    self.alertTitle = @"E-Mail para contato";
    self.alertView.title = self.alertTitle;
    
    UITextField *textField = [self.alertView textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeEmailAddress;
    textField.keyboardAppearance = UIKeyboardAppearanceDark;
    [self.alertView show];

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
