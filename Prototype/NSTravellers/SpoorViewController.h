//
//  SpoorViewController.h
//  NSTravellers
//
//  Created by Max Kievits on 07/03/2019.
//  Copyright © 2019 MaxMedia-Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@import AVFoundation;
@import AVKit;

NS_ASSUME_NONNULL_BEGIN

@interface SpoorViewController : UIViewController {

    IBOutlet UILabel *utrechtMarker;
    IBOutlet UILabel *woerdenMarker;
    IBOutlet UILabel *goverwelleMarker;
    IBOutlet UILabel *goudaMarker;
    IBOutlet UILabel *zoetermeerMarker;
    IBOutlet UILabel *voorburgMarker;
    IBOutlet UILabel *denhaagMarker;
    
    IBOutlet UISlider *testSlider;
    
    float train1Progress;
    UIImageView *trainView;
}
- (IBAction)sliderChanged:(id)sender;

@property UIBezierPath *pathPath;
@property UIView *testView;

@end

NS_ASSUME_NONNULL_END
