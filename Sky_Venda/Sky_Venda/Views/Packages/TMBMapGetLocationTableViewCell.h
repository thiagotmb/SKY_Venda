//
//  TMBMapGetLocationTableViewCell.h
//  Sky_Venda
//
//  Created by Thiago-Bernardes on 8/17/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "TMBSignatureSingleton.h"
@interface TMBMapGetLocationTableViewCell : UITableViewCell<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) NSString* Cep;

@property (nonatomic) CLLocationManager *locationManager;

- (IBAction)getMyLocation:(id)sender;

@end
