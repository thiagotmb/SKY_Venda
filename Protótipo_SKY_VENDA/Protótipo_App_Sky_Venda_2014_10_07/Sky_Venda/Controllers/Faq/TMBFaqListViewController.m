//
//  TMBFaqListViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/7/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBFaqListViewController.h"

@interface TMBFaqListViewController ()

@end

@implementation TMBFaqListViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TMBFaqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FaqCell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.question.text = @"Quem é a empresa responsavel por este App?";
            break;
        case 1:
            cell.question.text = @"Qual as vantagens de ser um assinante SKY?";
            break;
        default:
            break;
    }
    
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    TMBFaqAnswerViewController *answer = segue.destinationViewController;
    switch (self.tableView.indexPathForSelectedRow.row)
 {
        case 0:
            answer.questionText = @"Quem é a empresa responsavel por este App?";
            answer.answerText = @"Multi Sat, CNPJ:00000-0000, Endereço:Rua ABC, Telefone:2929-2929, E-Mail:129321";
            break;
        case 1:
            answer.questionText = @"Qual as vantagens de ser um assinante SKY?";
            answer.answerText = @"Interatividade, Canais de Rádio, ETC";
            break;
        default:
            break;
    }
    
    
}

@end
