//
//  SpoorViewController.m
//  NSTravellers
//
//  Created by Max Kievits on 07/03/2019.
//  Copyright © 2019 MaxMedia-Apps. All rights reserved.
//

#import "SpoorViewController.h"
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)


@interface SpoorViewController ()

@end

@implementation SpoorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    utrechtMarker.hidden = true;
    woerdenMarker.hidden = true;
    goverwelleMarker.hidden = true;
    goudaMarker.hidden = true;
    zoetermeerMarker.hidden = true;
    voorburgMarker.hidden = true;
    denhaagMarker.hidden = true;

    trainView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    trainView.image = [UIImage imageNamed:@"trainDotBlue"];
    trainView.center = utrechtMarker.center;
    [self.view addSubview:trainView];
    
    train1Progress = 1000;

    //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTrains) userInfo:nil repeats:true];
    //[self updateTrains];
    
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.testView.backgroundColor = [UIColor greenColor];
    
    
    [self.view addSubview:self.testView];
    
    //// path Drawing
    UIBezierPath* pathPath = UIBezierPath.bezierPath;
    [pathPath moveToPoint: CGPointMake(1031.5, 521.5)];
    [pathPath addLineToPoint: CGPointMake(802.5, 521.5)];
    [pathPath addLineToPoint: CGPointMake(636.5, 686.5)];
    [pathPath addLineToPoint: CGPointMake(458.5, 686.5)];
    [pathPath addLineToPoint: CGPointMake(401.5, 629.5)];
    [pathPath addLineToPoint: CGPointMake(401.5, 571.5)];
    [pathPath addLineToPoint: CGPointMake(633.5, 338.5)];
    [pathPath addLineToPoint: CGPointMake(586.5, 292.5)];
    [pathPath addLineToPoint: CGPointMake(527.5, 292.5)];
    [pathPath addLineToPoint: CGPointMake(491.5, 257.5)];
    [pathPath addLineToPoint: CGPointMake(380.5, 257.5)];
    [pathPath addLineToPoint: CGPointMake(380.5, 29.5)];
    [pathPath addLineToPoint: CGPointMake(419.5, -10.5)];
    //[UIColor.redColor setStroke];
    //pathPath.lineWidth = 1;
    //[pathPath stroke];
}

-(void)updateTrains {
    if (self->train1Progress <= 2220) {
        self->train1Progress += 1;
        
        float train1ProgressFloat = (self->train1Progress / 2220);
        NSLog(@"%f",train1ProgressFloat);
        self->trainView.center = [self newTrainPositionWithProgress:train1ProgressFloat andCurrentPoint:self->trainView.center];
    }
}

- (IBAction)sliderChanged:(UISlider *)sender {
    //NSLog(@"%@",NSStringFromCGPoint(trainView.center));
    trainView.center = [self newTrainPositionWithProgress:sender.value andCurrentPoint:trainView.center];
    [self sliderDidSlide:sender];
}

- (void)sliderDidSlide:(UISlider *)slider
{
    
    // Create and configure a new CAKeyframeAnimation instance
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.0;
    animation.path = self.pathPath.CGPath;
    animation.speed = 0;
    animation.removedOnCompletion = NO;
    animation.timeOffset = slider.value;
    
    // Replace the current animation with a new one having the desired timeOffset
    [self.testView.layer addAnimation:animation forKey:@"LabelPathAnimation"];
    
    
    if (slider.value > 0.5) {
        [UIView animateWithDuration:0.3 animations:^{
            self.testView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.testView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
}

-(CGPoint)newTrainPositionWithProgress:(float)progress andCurrentPoint:(CGPoint)point {
    if (point.x < 634 && point.x >= 551) {
        float trainXPoint = self->denhaagMarker.center.x + ((self->utrechtMarker.center.x - self->denhaagMarker.center.x) * progress);
        float yDistance = self->utrechtMarker.center.y - self->denhaagMarker.center.y;
        float yProgress = (trainXPoint - self->goudaMarker.center.x) / (self->woerdenMarker.center.x - self->goudaMarker.center.x);
        float trainYPoint = self->denhaagMarker.center.y + (yDistance * yProgress);
        return point = CGPointMake(trainXPoint, trainYPoint);
    }
    
    else if (trainView.center.x > 634) {
        float trainXPoint = self->denhaagMarker.center.x + ((self->utrechtMarker.center.x - self->denhaagMarker.center.x) * progress);
        return point = CGPointMake(trainXPoint, self->utrechtMarker.center.y);
    }
    
    else if (trainView.center.x < 551) {
        float trainXPoint = self->denhaagMarker.center.x + ((self->utrechtMarker.center.x - self->denhaagMarker.center.x) * progress);
        return point = CGPointMake(trainXPoint, self->denhaagMarker.center.y);
    }
    
    else {
        return point = CGPointMake(self->denhaagMarker.center.x + ((self->utrechtMarker.center.x - self->denhaagMarker.center.x) * progress), point.y);
    }
}


@end
