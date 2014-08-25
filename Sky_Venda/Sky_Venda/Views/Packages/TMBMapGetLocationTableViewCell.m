//
//  TMBMapGetLocationTableViewCell.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBMapGetLocationTableViewCell.h"
#define METERS_PER_MILE 1609.344

@implementation TMBMapGetLocationTableViewCell{
    
    TMBSignatureSingleton *sharedSignatureData;
    CLLocationCoordinate2D zoomLocation;

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    sharedSignatureData = [TMBSignatureSingleton sharedData];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.backgroundColor = [UIColor clearColor];

    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Não foi possível pegar sua localização, verifique suas conexões" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [errorAlert show];
    NSLog(@"Error: %@",error.description);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    self.Cep = [NSString stringWithFormat:@"%.8f, %.8f",crnLoc.coordinate.latitude,crnLoc.coordinate.longitude];
    
    
    
    zoomLocation.latitude = crnLoc.coordinate.latitude;
    zoomLocation.longitude = crnLoc.coordinate.longitude;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)getMyLocation:(id)sender {
    [self.locationManager startUpdatingLocation];

    if (self.Cep) {
        sharedSignatureData.signature.installationAdress.cep = self.Cep;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LocationReceived" object:self];
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        
        [self.mapView setRegion:viewRegion animated:YES];

    }
        
    NSLog(@"%@",sharedSignatureData.signature.installationAdress.cep);

    
}



@end
