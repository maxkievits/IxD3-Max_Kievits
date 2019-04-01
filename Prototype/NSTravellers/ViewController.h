//
//  ViewController.h
//  NSTravellers
//
//  Created by Max Kievits on 06/03/2019.
//  Copyright © 2019 MaxMedia-Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>


@interface ViewController : UIViewController 

@property (readwrite, nonatomic, strong) IBOutlet MKMapView *mapView;

@property NSArray *jsonArray;
@property NSMutableArray *overlayArray;
@property NSArray *ritnummerArray;

@end

