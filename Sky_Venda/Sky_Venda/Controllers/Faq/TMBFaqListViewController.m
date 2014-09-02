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
#import "TMBContactRequestor.h"
#import "TMBSignatureSingleton.h"

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

@property (nonatomic) TMBContactRequestor* contactRequestor;



@end

@implementation TMBFaqListViewController{
    
    TMBFaqSingleton *sharedFaqList;
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
    sharedFaqList = [TMBFaqSingleton sharedData];
    sharedSignatureData = [TMBSignatureSingleton sharedData];
    
    self.faqList = sharedFaqList.faqList;
    
    self.faqItem = sharedFaqList.faqItem;
    
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]];
    
    
    self.alertView = [[UIAlertView alloc] initWithTitle:self.alertTitle message:nil delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Solicitar",nil];
    self.alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    self.contactField = [self.alertView textFieldAtIndex:0];
    self.contactField.keyboardAppearance = UIKeyboardAppearanceDark;
    self.contactField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    self.contactField.textColor = [UIColor colorWithHue:0 saturation:1 brightness:.5 alpha:1];
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(requestFaqList) forControlEvents:UIControlEventValueChanged];
    
    self.contactRequestor = [[TMBContactRequestor alloc] init];
    
    
    

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
    
    self.contactField.keyboardType = UIKeyboardTypeNumberPad;
    self.contactField.text = sharedSignatureData.signature.client.phoneNumber;
    self.contactRequestor.type = 0;

    
    [self.alertView show];
    
}

- (IBAction)requestWhatsappContact:(id)sender {
    
    self.alertTitle = @"Whatsapp para contato";
    self.alertView.title = self.alertTitle;
    
    self.contactField.keyboardType = UIKeyboardTypeNumberPad;
    self.contactField.text = sharedSignatureData.signature.client.phoneNumber;
    self.contactRequestor.type = 1;

    
    [self.alertView show];
    
}

- (IBAction)requestEmailContact:(id)sender {
    
    self.alertTitle = @"E-Mail para contato";
    self.alertView.title = self.alertTitle;
    
    self.contactField.keyboardType = UIKeyboardTypeEmailAddress;
    self.contactField.text = sharedSignatureData.signature.client.email;
    
    self.contactRequestor.type = 2;
    
    [self.alertView show];

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    switch (buttonIndex) {
        case 0:
            return;
            break;
        case 1:{
            self.contactRequestor.contact = [alertView textFieldAtIndex:0].text;
            self.contactRequestor.dateOfRequest = [NSString stringWithFormat:@"%@",[NSDate date]];
            [self requestContact:self.contactRequestor];
            UIAlertView* okAlert = [[UIAlertView alloc] initWithTitle:@"Solicitado!" message:@"Em instantes um atendente entrará em contato"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [okAlert show];
        }
        default:
            return;
            break;
    }
    
}

- (BOOL)requestContact:(TMBContactRequestor*)contactRequestor{
    //1.  Log the tag for verification first
    
    
    NSURL *myURL = [NSURL URLWithString:@"http://sky4gtv.com.br/php/contactRequest.php"];
    NSString *dbHost = [NSString stringWithFormat:@"sky4gtvcombr.ipagemysql.com"];
    NSString *dbPassword = [NSString stringWithFormat:@"bEk}Id)Ceas."];
    NSString *dbUserName = [NSString stringWithFormat:@"iosapp"];
    NSString *dbName = [ NSString stringWithFormat:@"sky_sales"];
    
	//2.REBUILD status string from passingObject
    NSString *dataToPost = ([[NSString alloc] initWithFormat:@"DBHost=%@&DBUserName=%@&DBPassword=%@&DBName=%@&RequestorContact=%@&DateOfRequest=%@&RequestType=%d",dbHost,dbUserName,dbPassword,dbName,contactRequestor.contact,contactRequestor.dateOfRequest,contactRequestor.type]);
    
    NSData *postData = [dataToPost dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:myURL];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];

    
    NSURLResponse *response;
    NSError *error;
	// We should probably be parsing the data returned by this call, for now just check the error.
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"%@!",request);
    return (error == nil);
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
