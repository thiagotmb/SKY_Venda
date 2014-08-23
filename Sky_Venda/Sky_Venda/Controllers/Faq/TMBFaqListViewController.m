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

@interface TMBFaqListViewController ()

@property (nonatomic,strong) TMBFaq *faqItem;

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
    // Do any additional setup after loading the view.
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
    
    self.faqItem = self.faqList[indexPath.row];
    cell.question.text = self.faqItem.question;
    
    
    return cell;
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"passei");
    
    sharedFaqList.faqItem = [self.faqList objectAtIndex:indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TMBFaqAnswerViewController *clientDataViewController = (TMBFaqAnswerViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBFaqAnswerViewController"];
    
    [self.navigationController pushViewController:clientDataViewController animated:YES];
    
    return indexPath;
}

@end
