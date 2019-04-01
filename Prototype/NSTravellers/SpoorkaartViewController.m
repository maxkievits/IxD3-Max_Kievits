//
//  SpoorkaartViewController.m
//  NSTravellers
//
//  Created by Max Kievits on 07/03/2019.
//  Copyright © 2019 MaxMedia-Apps. All rights reserved.
//

#import "SpoorkaartViewController.h"

@import MapKit;

#define EARTH_RADIUS 6371


@interface SpoorkaartViewController ()

@end

@implementation SpoorkaartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self downloadItems];
}

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

                    
                    for (NSDictionary *object in self.jsonArray) {
                        
                        float latFloat;
                        float lngFloat;
                        
                        if ([object[@"lat"] floatValue] != 0) {
                            latFloat = ([object[@"lat"] floatValue]);
                        } else {
                            latFloat = 0;
                        }
                        
                        lngFloat = ([object[@"lng"] floatValue]);

                        //MKMapPoint mapPoint = MKMapPointForCoordinate(CLLocationCoordinate2DMake(latFloat, lngFloat));


                        
                        if (latFloat != 0 && lngFloat != 0) {
                            
                            /*CGPoint myPoint = [self convertLatLongCoord:CGPointMake(lngFloat, latFloat)];
                            
                            UIView *trainView = [[UIView alloc] initWithFrame:CGRectMake(myPoint.x, myPoint.y , 2, 2)];
                            trainView.backgroundColor = [UIColor redColor];
                            
                            [self.view addSubview:trainView];
                             */
                        }
                        
                        
                        
                        //NSLog(@"LAT: %f - LNG: %f", latFloat, lngFloat);

                    }
                }
            });
            
        }];
        
        [task resume];
    });
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*

@IBAction func addPointClick(sender: AnyObject)
{
    let coordinates2d = CLLocationCoordinate2DMake(CLLocationDegrees(latLabel.text!)!, CLLocationDegrees(lngLabel.text!)!)
    
    mapImageView.addLocation(coordinate: coordinates2d)
    
    // max MKMapPoint values
    let maxY = Double(267995781)
    let maxX = Double(268435456)
    
    
    let mapPoint = MKMapPoint(coordinates2d)
    
    let normalizatePointX = CGFloat(mapPoint.x / maxX)
    let normalizatePointY = CGFloat(mapPoint.y / maxY)
    
    let pointView = UIView(frame: CGRectMake(0, 0, 5, 5))
    pointView.center = CGPointMake(normalizatePointX * mapImageView.frame.width, normalizatePointY * mapImageView.frame.height)
    pointView.backgroundColor = UIColor.blue
    
    mapImageView.addSubview(pointView)
}

@IBAction func clearButtonClick(sender: AnyObject)
{
    mapImageView.subviews.forEach({ $0.removeFromSuperview() })
}
}


extension UIView
{
    func addLocation(coordinate: CLLocationCoordinate2D)
    {
        // max MKMapPoint values
        let maxY = Double(267995781)
        let maxX = Double(268435456)
        
        let mapPoint = MKMapPoint(coordinate)
        
        let normalizatePointX = CGFloat(mapPoint.x / maxX)
        let normalizatePointY = CGFloat(mapPoint.y / maxY)
        
        let pointView = UIView(frame: CGRectMake(0, 0, 5, 5))
        pointView.center = CGPointMake(normalizatePointX * frame.width, normalizatePointY * frame.height)
        
        pointView.backgroundColor = UIColor.blue
        
        addSubview(pointView)
    }
}
 */

@end
