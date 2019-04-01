//
//  ViewController.m
//  NSTravellers
//
//  Created by Max Kievits on 06/03/2019.
//  Copyright © 2019 MaxMedia-Apps. All rights reserved.
//

#import "ViewController.h"

#import <MapKit/MapKit.h>

#import "GeoJSONSerialization.h"

@interface ViewController () <MKMapViewDelegate>
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.overlayArray = [[NSMutableArray alloc] init];
    
    [self downloadItems];
    [NSTimer scheduledTimerWithTimeInterval:10 repeats:true block:^(NSTimer * _Nonnull timer) {
        [self downloadItems];
    }];
    
    self.mapView.delegate = self;
    //self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsTraffic = false;
    self.mapView.showsPointsOfInterest = false;
    self.mapView.showsBuildings = false;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleMapTap:)];
    tap.cancelsTouchesInView = NO;
    tap.numberOfTapsRequired = 1;
    [self.mapView addGestureRecognizer:tap];

    
    NSData *data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"spoorkaart" withExtension:@"geojson"]];
    NSDictionary *geoJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *shapes = [GeoJSONSerialization shapesFromGeoJSONFeatureCollection:geoJSON error:nil];
    
    for (MKShape *shape in shapes) {
        if ([shape isKindOfClass:[MKPointAnnotation class]]) {
            [self.mapView addAnnotation:shape];
        } else if ([shape conformsToProtocol:@protocol(MKOverlay)]) {
            [self.mapView addOverlay:(id <MKOverlay>)shape];
        }
    }
}
/*
-(void)downloadRitnummers {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        //https://walibiapp.com/images/<IMAGE>
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://ns-api.nl/virtualtrain/api/v1/locatie/treinen"]];
        
        //https://ns-api.nl/virtualtrain/api/v1/locatie/treinen
        //http://aviation-edge.com/v2/public/flights?key=8ac576-ec336e&limit=30000&arrIata=AMS
        [request addValue:@"e4wENo0QRw5C7qsERkUjNaVURqwR86dwae0L1uV1" forHTTPHeaderField:@"x-api-key"];
        
        //create the task
        NSURLSessionDataTask* task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (!(data == nil)) {
                    // Parse the JSON that came in
                    NSError *error;
                    
                    NSArray *array1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                    NSMutableArray *array2 = [NSMutableArray new];
                    for (NSDictionary *object in array1) {
                        [array2 addObject:object[@"materieelDeel"]];
                    }
                    self.ritnummerArray = [array2 copy];
                }
            });
        }];
        [task resume];
        
    });
}

 */
-(void)downloadItems {
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        //https://walibiapp.com/images/<IMAGE>
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://ns-api.nl/virtualtrain/api/v1/locatie/treinen"]];
        
        //https://ns-api.nl/virtualtrain/api/v1/locatie/treinen
        //http://aviation-edge.com/v2/public/flights?key=8ac576-ec336e&limit=30000&arrIata=AMS
        [request addValue:@"e4wENo0QRw5C7qsERkUjNaVURqwR86dwae0L1uV1" forHTTPHeaderField:@"x-api-key"];
        
        //create the task
        NSURLSessionDataTask* task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (!(data == nil)) {
                    // Parse the JSON that came in
                    NSError *error;
                    
                    self.jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                    
                    //NSLog(@"%@",self.jsonArray);
                    
                    NSMutableArray *array2 = [NSMutableArray new];
                    for (NSDictionary *object in self.jsonArray) {
                        /*
                        NSString *materieelDeel = object[@"materieelDeel"];
                        if ([[NSString stringWithFormat:@"%@",materieelDeel] isEqualToString:@"8608"] ||
                            [[NSString stringWithFormat:@"%@",materieelDeel] isEqualToString:@"2503"] ||
                            [[NSString stringWithFormat:@"%@",materieelDeel] isEqualToString:@"9594"] ||
                            [[NSString stringWithFormat:@"%@",materieelDeel] isEqualToString:@"2218"] ||
                            [[NSString stringWithFormat:@"%@",materieelDeel] isEqualToString:@"9551"]) {
                            
                            [array2 addObject:object];
                        }
                         */
                        [array2 addObject:object];

                    }
                    self.ritnummerArray = [array2 copy];

                    for (MKCircle *circle in self.overlayArray) {
                        [self.mapView removeOverlay:circle];
                    }
                    
                    NSLog(@"%@",self.ritnummerArray);

                    
                    //NSLog(@"%ld",self.jsonArray.count);
                    
                    self.overlayArray = [[NSMutableArray alloc] init];

                    for (NSDictionary *object in self.ritnummerArray) {
                        float latFloat = [object[@"lat"] floatValue];
                        float longFloat = [object[@"lng"] floatValue];
                        MKCircle *treinCircle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(latFloat, longFloat) radius:500];
                        treinCircle.title = object[@"materieelDeel"];
                        [self.overlayArray addObject:treinCircle];
                    }
                    
                    [self.mapView addOverlays:self.overlayArray];
                    
                    //[self.mapview overlayat]

                }
            });
            
        }];
        
        [task resume];
    });
    
}

-(void)updateLocations {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://ns-api.nl/virtualtrain/api/v1/locatie/treinen"]];
        
        
        //https://ns-api.nl/virtualtrain/api/v1/locatie/treinen
        //http://aviation-edge.com/v2/public/flights?key=8ac576-ec336e&limit=30000&arrIata=AMS
        [request addValue:@"e4wENo0QRw5C7qsERkUjNaVURqwR86dwae0L1uV1" forHTTPHeaderField:@"x-api-key"];
        
        //create the task
        NSURLSessionDataTask* task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (!(data == nil)) {
                    // Parse the JSON that came in
                    NSError *error;
                    
                    self.jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                    
                    for (NSDictionary *object in self.jsonArray) {
                        for (id<MKOverlay> overlay in self.mapView.overlays) {
                            if([overlay isKindOfClass:[MKCircle class]]){
                                //NSInteger objectIndex = [self.mapView.overlays indexOfObject:overlay];
                                if ([overlay.title isEqual:object[@"materieelDeel"]]) {
                                    //overlay.coordinate = CLLocationCoordinate2DMake([object[@"lat"] floatValue], [object[@"lng"] floatValue]);
                                    [overlay setCoordinate:CLLocationCoordinate2DMake([object[@"lat"] floatValue], [object[@"lng"] floatValue])];
                                }
                            }
                        }
                    }
                }
            });
            
        }];
        
        [task resume];
    });
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString * PinIdentifier = @"Pin";
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:PinIdentifier];
    
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:PinIdentifier];
    };
    
    annotationView.hidden = ![annotation isKindOfClass:[MKPointAnnotation class]];
    
    return annotationView;
}


- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
            rendererForOverlay:(id <MKOverlay>)overlay
{
    MKOverlayRenderer *renderer = nil;
    
    
    if ([overlay isKindOfClass:[MKCircle class]]) {
        MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc] initWithCircle:overlay];
        circleRenderer.fillColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.3];
                
        for (NSDictionary *object in self.jsonArray) {
            if([overlay isKindOfClass:[MKCircle class]]){
                //NSInteger objectIndex = [self.mapView.overlays indexOfObject:overlay];
                if ([overlay.title isEqual:object[@"materieelDeel"]]) {
                    if ([object[@"snelheid"] integerValue] < 30) {
                        circleRenderer.fillColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.3];
                        circleRenderer.strokeColor = [UIColor redColor];
                    }
                    else if ([object[@"snelheid"] integerValue] > 30 && ([object[@"snelheid"] integerValue] < 60)) {
                        circleRenderer.fillColor = [UIColor colorWithRed:255 green:255 blue:0 alpha:0.3];
                        circleRenderer.strokeColor = [UIColor yellowColor];
                    }
                    else {
                        circleRenderer.fillColor = [UIColor colorWithRed:0 green:255 blue:0 alpha:0.3];
                        circleRenderer.strokeColor = [UIColor greenColor];
                    }
                }
            }
        }
        
    
        circleRenderer.lineWidth = 1.0f;
        
        return circleRenderer;
    }
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        renderer = [[MKPolylineRenderer alloc] initWithPolyline:(MKPolyline *)overlay];
        ((MKPolylineRenderer *)renderer).strokeColor = [UIColor blackColor];
        ((MKPolylineRenderer *)renderer).lineWidth = 3.0f;
    }
    
    renderer.alpha = 0.5;
    
    return renderer;
}

-(void)handleMapTap:(UIGestureRecognizer*)tap{
    CGPoint tapPoint = [tap locationInView:self.mapView];
    
    CLLocationCoordinate2D tapCoord = [self.mapView convertPoint:tapPoint toCoordinateFromView:self.mapView];
    MKMapPoint mapPoint = MKMapPointForCoordinate(tapCoord);
    CGPoint mapPointAsCGP = CGPointMake(mapPoint.x, mapPoint.y);
    
    for (id<MKOverlay> overlay in self.mapView.overlays) {
        if([overlay isKindOfClass:[MKPolygon class]]){
            MKPolygon *polygon = (MKPolygon*) overlay;
            
            CGMutablePathRef mpr = CGPathCreateMutable();
            
            MKMapPoint *polygonPoints = polygon.points;
            
            for (int p=0; p < polygon.pointCount; p++){
                MKMapPoint mp = polygonPoints[p];
                if (p == 0)
                    CGPathMoveToPoint(mpr, NULL, mp.x, mp.y);
                else
                    CGPathAddLineToPoint(mpr, NULL, mp.x, mp.y);
            }
            
            if(CGPathContainsPoint(mpr , NULL, mapPointAsCGP, FALSE)){
                // ... found it!
                NSLog(@"GEDRUKT!");
            }
            
            CGPathRelease(mpr);
        }
    }
}

@end
