//
//  TMBMapGetLocationTableViewCell.m
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBMapGetLocationTableViewCell.h"
#define METERS_PER_MILE 1609.344
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1


@implementation TMBMapGetLocationTableViewCell{
    
    TMBSignatureSingleton *sharedSignatureData;
    CLLocationCoordinate2D zoomLocation;
    
    TMBAdress* _adresses;

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
    NSLog(@"TMBGetLocation Error: %@",error.description);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    
    zoomLocation.latitude = crnLoc.coordinate.latitude;
    zoomLocation.longitude = crnLoc.coordinate.longitude;

    dispatch_async(kBgQueue, ^{
        NSString *urlAsString = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?address=%.8f,%.8f&sensor=false",zoomLocation.latitude,zoomLocation.longitude];
        NSURL *url = [[NSURL alloc] initWithString:urlAsString];
        NSData* data = [NSData dataWithContentsOfURL:
                        url];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    

    
}

-(void)fetchedData:(NSData*)responseData{
    
    
    NSError* error;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    NSArray* latestResult = [json objectForKeyedSubscript:@"results"];
    
    self.adress = [self getAdressForJSONResult:latestResult];
    
    
    
   
   // NSLog(@"result %@",[[adress valueForKey:@"address_components"] valueForKey:@"long_name"]);
    

}

-(TMBAdress*)getAdressForJSONResult:(NSArray*)latestResult{
    
    NSDictionary* adress = [latestResult objectAtIndex:0];
    NSDictionary* adressForCep = [latestResult objectAtIndex:1];
    
    NSArray *stateType= @[@"administrative_area_level_1",@"political"];
    NSArray *cityType= @[@"locality",@"political"];
    NSArray *cityType2 = @[@"sublocality_level_1",@"sublocality",@"political"];
    NSArray *sectorType= @[@"neighborhood",@"political"];
    NSArray *streetType= @[@"route"];
    NSArray *numberType= @[@"street_number"];
    
    NSArray *cepType= @[@"postal_code"];
    
    NSArray *adressArray = [[adress valueForKey:@"address_components"] valueForKey:@"types"];
    TMBAdress *adressByGoogleMaps = [[TMBAdress alloc] init];
    
    int i =0;
    for (NSArray* adressType in adressArray) {
        if ([adressType isEqualToArray:cityType] || [adressType isEqualToArray:cityType2]) {
            adressByGoogleMaps.city = [[adress valueForKey:@"address_components"][i] valueForKey:@"long_name"];
        }
        if ([adressType isEqualToArray:stateType]) {
            NSString* state = [[adress valueForKey:@"address_components"][i] valueForKey:@"long_name"];
            if ([state isEqual:@"Federal District"] ) {
                state = @"Distrito Federal";
            }
            adressByGoogleMaps.state = state;
        }
        if ([adressType isEqualToArray:sectorType]) {
            adressByGoogleMaps.sector = [[adress valueForKey:@"address_components"][i] valueForKey:@"long_name"];
        }
        if ([adressType isEqualToArray:streetType]) {
            adressByGoogleMaps.street = [[adress valueForKey:@"address_components"][i] valueForKey:@"long_name"];
        }
        if ([adressType isEqualToArray:numberType]) {
            adressByGoogleMaps.number = [[adress valueForKey:@"address_components"][i] valueForKey:@"long_name"];
        }
        if ([adressType isEqualToArray:cepType]) {
            adressByGoogleMaps.cep = [[adress valueForKey:@"address_components"][i] valueForKey:@"long_name"];
        }
        i++;
    }
    
    i = 0;
    adressArray = [[adressForCep valueForKey:@"address_components"] valueForKey:@"types"];
    for (NSArray* adressType in adressArray) {
        if ([adressType isEqualToArray:cepType]) {
            adressByGoogleMaps.cep = [[adressForCep valueForKey:@"address_components"][i] valueForKey:@"long_name"];
        }
        i++;
    }
    
    //NSLog(@"%@",adressByGoogleMaps);

    return adressByGoogleMaps;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)getMyLocation:(id)sender {
    [self.locationManager startUpdatingLocation];

    if (self.adress) {
        sharedSignatureData.signature.installationAdress = self.adress;
       // NSLog(@"%.8f,%.8f",zoomLocation.latitude,zoomLocation.longitude);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LocationReceived" object:nil];
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        
        [self.mapView setRegion:viewRegion animated:YES];

    }
        
   // NSLog(@"%@",sharedSignatureData.signature.installationAdress.cep);

    
}



@end
