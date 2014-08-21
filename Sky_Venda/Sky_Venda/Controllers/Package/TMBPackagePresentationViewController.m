//
//  TMBPackagePresentationViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/18/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPackagePresentationViewController.h"

@interface TMBPackagePresentationViewController ()

@property(nonatomic,strong) IBOutlet iCarousel *packagePresentPrincipalView;
@property(nonatomic,strong) UIImage *packageImage;

@property (weak, nonatomic) IBOutlet UITableView *packageDetailTableView;

@end

@implementation TMBPackagePresentationViewController

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
    
    self.packagePresentPrincipalView.type = iCarouselTypeCoverFlow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    return cell;
}

#pragma mark - iCarousel methods

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return 4;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    
    CGRect imageViewFrame = CGRectMake(0, 0, self.packagePresentPrincipalView.frame.size.width/1.7, self.packagePresentPrincipalView.frame.size.height);
    
    self.packageImage = [UIImage imageNamed:[NSString stringWithFormat:@"SKY%ld.png",(long)index]];
    UIImageView *packagePresentImageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    
    packagePresentImageView.image = self.packageImage;
    packagePresentImageView.backgroundColor = [UIColor redColor];
    
    return packagePresentImageView;
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        case iCarouselOptionFadeMax:
        {
            if (carousel.type == iCarouselTypeCustom)
            {
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionArc:
        {
            return 2 * M_PI * 90;
        }
        case iCarouselOptionRadius:
        {
            return value * 90;
        }
        case iCarouselOptionTilt:
        {
            return 1;
        }
        case iCarouselOptionSpacing:
        {
            return value * 1;
        }
        default:
        {
            return value;
        }
    }
}

-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    
    //NSLog(@"%d",self.packagePresentPrincipalView.currentItemIndex);
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
    //NSLog(@"%d",self.packagePresentPrincipalView.currentItemIndex);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TMBClientDataViewController *clientDataViewController = (TMBClientDataViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBClientDataViewController"];

    NSString *selectedPackage = [NSString stringWithFormat:@"%ld",(long)self.packagePresentPrincipalView.currentItemIndex];
    [[TMBSignatureData sharedData] setSelectedPackage:selectedPackage];
    
    [self.navigationController pushViewController:clientDataViewController animated:YES];
}

#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
