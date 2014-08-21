//
//  TMBDataCheckViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/15/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBDataCheckViewController.h"

@interface TMBDataCheckViewController ()

#define NUMBER_OF_SECTIONS 1
#define NUMBER_OF_ROWS_IN_SECTION_DEFAULT 16

enum TMBTableViewRow:NSInteger{
    
    TMBTableViewRowClientName = 0,
    TMBTableViewRowClientGender = 1,
    TMBTableViewRowClientRg = 2,
    TMBTableViewRowClientCpf = 3,
    TMBTableViewRowClientSocialReason = 4,
    TMBTableViewRowClientEmail = 5,
    TMBTableViewRowClientPhoneNumber = 6,
    TMBTableViewRowClientBirthDate = 7,
    
    TMBTableViewRowInstallationAdressCep = 8,
    TMBTableViewRowInstallationAdressCity = 9,
    TMBTableViewRowInstallationAdressState = 10,
    TMBTableViewRowInstallationAdressSector = 11,
    TMBTableViewRowInstallationAdressStreet = 12,
    TMBTableViewRowInstallationAdressNumber = 13,
    TMBTableViewRowInstallationAdressComplement = 14,

    TMBTableViewRowNextSepButton = 15,
    
    
    
    
};
@end

@implementation TMBDataCheckViewController

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
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Nome";
            cell.contentLabel.text = [[TMBSignatureData sharedData] clientName];
            return cell;
            break;
        }
        case TMBTableViewRowClientGender:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Sexo";
            cell.contentLabel.text = [[TMBSignatureData sharedData] clientGender];
            return cell;
            break;
        }
        case TMBTableViewRowClientRg:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"RG";
            cell.contentLabel.text = [[TMBSignatureData sharedData] clientRg];
            return cell;
            break;
        }
        case TMBTableViewRowClientCpf:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"CPF";
            cell.contentLabel.text = [[TMBSignatureData sharedData] clientCpf];
            return cell;
            break;
        }
        case TMBTableViewRowClientSocialReason:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Razão Social";
            cell.contentLabel.text = [[TMBSignatureData sharedData] clientSocialReason];
            return cell;
            break;
        }
        case TMBTableViewRowClientEmail:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"E-Mail";
            cell.contentLabel.text = [[TMBSignatureData sharedData] clientEmail];
            return cell;
            break;
        }
        case TMBTableViewRowClientPhoneNumber:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Telefone";
            cell.contentLabel.text = [[TMBSignatureData sharedData] clientPhoneNumber];
            return cell;
            break;
        }
        case TMBTableViewRowClientBirthDate:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Nascimento";
            cell.contentLabel.text = [[TMBSignatureData sharedData] clientBirthDate];
            return cell;
            break;
        }
            
        case TMBTableViewRowInstallationAdressCep:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"CEP";
            cell.contentLabel.text = [[TMBSignatureData sharedData] installationAdressCep];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressCity:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Cidade";
            cell.contentLabel.text = [[TMBSignatureData sharedData] installationAdressCity];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressState:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Estado";
            cell.contentLabel.text = [[TMBSignatureData sharedData] installationAdressState];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressSector:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Bairro";
            cell.contentLabel.text = [[TMBSignatureData sharedData] installationAdressSector];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressStreet:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Rua";
            cell.contentLabel.text = [[TMBSignatureData sharedData] installationAdressStreet];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressNumber:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Número";
            cell.contentLabel.text = [[TMBSignatureData sharedData] installationAdressNumber];
            return cell;
            break;
        }
        case TMBTableViewRowInstallationAdressComplement:{
            TMBTextLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextLabelCell" forIndexPath:indexPath];
            cell.titleLabel.text = @"Complemento";
            cell.contentLabel.text = [[TMBSignatureData sharedData] installationAdressComplement];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
