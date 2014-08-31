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

@property (nonatomic) BOOL didAppear;

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
    sharedPackageData = [TMBPackageSingleton sharedData];
    
    self.packagePresentPrincipalView.type = iCarouselTypeCoverFlow;
    self.packageDetailTableView.backgroundColor = [UIColor clearColor];
    self.packagePresentPrincipalView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]];
    
    [self.packagePresentPrincipalView setCurrentItemIndex:9];

    [UIView animateWithDuration:1.f
                          delay:0.2f
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         
                         //image.alpha = 0.0;
                         //self.packagePresentPrincipalView.frame = CGRectMake(0, self.view.center.y, self.view.frame.size.width, self.view.frame.size.height);
                         self.packageDetailTableView.frame = CGRectMake(self.view.frame.size.width, self.packageDetailTableView.frame.origin.y,self.view.frame.size.width, self.view.frame.size.height);

                         [self.packagePresentPrincipalView setCurrentItemIndex:2];
                         
                     }
                     completion:nil];
    
   // [sharedPackageData requestPackageList];


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
    cell.contentView.backgroundColor = [UIColor clearColor];

    sharedSignatureData.signature.package = self.packageItem;


    cell.imageView.image = self.packageItem.detailImage;
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
/*

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10,0,300,60)];
    
    // create image object
    UIImage *myImage = [UIImage imageNamed:@"someimage.png"];;
    
    // create the label objects
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    headerLabel.frame = CGRectMake(0,18,200,20);
    headerLabel.text =  @"Filmes";
    headerLabel.textColor = [UIColor redColor];
    
    // create the imageView with the image in it
    UIImageView *imageView = [[UIImageView alloc] initWithImage:myImage];
    imageView.frame = CGRectMake(10,10,50,50);
    
    [customView addSubview:imageView];
    [customView addSubview:headerLabel];
    
    customView.backgroundColor = [UIColor clearColor];
    
    return customView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}


-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 100;
}


*/


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.packageItem.detailImage.size.height;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"%d",self.packagePresentPrincipalView.currentItemIndex);
    int selectedPackage = (int)self.packagePresentPrincipalView.currentItemIndex;
    self.packageItem = self.packageList[selectedPackage];
    sharedSignatureData.signature.package = self.packageItem;
    

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TMBClientDataViewController *clientDataViewController = (TMBClientDataViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TMBClientDataViewController"];
    [self.navigationController pushViewController:clientDataViewController animated:YES];
}

#pragma mark - iCarousel methods

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    sharedPackageData = [TMBPackageSingleton sharedData];
    // Do any additional setup after loading the view.
    self.packageList =  sharedPackageData.packageList;
    
    if (!self.didAppear) {
        TMBPackage *sky =[[TMBPackage alloc] init];
        sky.mainImage =    [UIImage imageNamed:@"SKYLOGO.png"];
        
        [self.packageList addObject:sky];
    }


    return self.packageList.count;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    
    
    
    CGRect imageViewFrame = CGRectMake(0, 0, self.packagePresentPrincipalView.frame.size.width/1.7, self.packagePresentPrincipalView.frame.size.height);
    
    
    UIImageView *packagePresentImageView = [[UIImageView alloc] initWithFrame:imageViewFrame];

    self.packageItem = self.packageList[index];

    packagePresentImageView.image = self.packageItem.mainImage;
    //packagePresentImageView.image = [UIImage imageNamed:@"LaunchImage@iphoneR4.png"];

    
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

-(void)reloadData{
    
    [self.packageDetailTableView reloadData];
    [self.packagePresentPrincipalView reloadData];
}

-(void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate{
    if (!self.didAppear) {
        self.didAppear = YES ;
        [self.packageList removeLastObject];
        
        [self.packagePresentPrincipalView reloadData];
        
    }
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
