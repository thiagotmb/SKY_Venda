//
//  TMBPackagePresentationViewController.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/18/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBPackagePresentationViewController.h"
#import "TMBImageTableViewCell.h"
#import "TMBSignatureSingleton.h"
#import "TMBPackageSingleton.h"
#import "TMBPackage.h"

@interface TMBPackagePresentationViewController ()

@property(nonatomic,strong) IBOutlet iCarousel *packagePresentPrincipalView;
@property (weak, nonatomic) IBOutlet UITableView *packageDetailTableView;
@property (nonatomic) NSMutableArray* packageList;
@property (nonatomic) TMBPackage* packageItem;

@end

@implementation TMBPackagePresentationViewController{
    
    TMBSignatureSingleton *sharedSignatureData;
    TMBPackageSingleton *sharedPackageData;
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

    self.packagePresentPrincipalView.type = iCarouselTypeCoverFlow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TMBImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PackageDetail" forIndexPath:indexPath];
    int selectedPackage = (int)self.packagePresentPrincipalView.currentItemIndex;
    self.packageItem = self.packageList[selectedPackage];
    sharedSignatureData.signature.package = self.packageItem;

    cell.imageView.image = self.packageItem.mainImage;
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.packageItem.mainImage.size.height;
}

#pragma mark - iCarousel methods

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    sharedPackageData = [TMBPackageSingleton sharedData];
    // Do any additional setup after loading the view.
    self.packageList =  sharedPackageData.packageList;
    return self.packageList.count;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    
    
    
    CGRect imageViewFrame = CGRectMake(0, 0, self.packagePresentPrincipalView.frame.size.width/1.7, self.packagePresentPrincipalView.frame.size.height);
    
    
    UIImageView *packagePresentImageView = [[UIImageView alloc] initWithFrame:imageViewFrame];

    self.packageItem = self.packageList[index];

    packagePresentImageView.image = self.packageItem.mainImage;
    
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
            [self.packageDetailTableView reloadData];
            return value;
        }

    }

}

-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    
    [UIView animateWithDuration:0.5f
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.packageDetailTableView setAlpha:0.f];
                         [self.packageDetailTableView reloadData];
                         
                     }
                     completion:nil];
    
    
    [UIView animateWithDuration:0.7f
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.packageDetailTableView setAlpha:1.f];
                         [self.packageDetailTableView reloadData];

                     }
                     completion:nil];
    //NSLog(@"%d",self.packagePresentPrincipalView.currentItemIndex);

}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
    //NSLog(@"%d",self.packagePresentPrincipalView.currentItemIndex);
    int selectedPackage = (int)self.packagePresentPrincipalView.currentItemIndex;
    self.packageItem = self.packageList[selectedPackage];
    sharedSignatureData.signature.package = self.packageItem;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TMBClientDataViewController *clientDataViewController = (TMBClientDataViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBClientDataViewController"];
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
