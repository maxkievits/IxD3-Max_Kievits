//
//  FinalViewController.h
//  NSTravellers
//
//  Created by Max Kievits on 20/03/2019.
//  Copyright © 2019 MaxMedia-Apps. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FinalViewController : UIViewController {
    
    //De pop-up view als je de slider verplaatst
    IBOutlet UIView *timePopupView;
    IBOutlet UILabel *timePopupLabel;
    
    //De paden van de treinen op de spoorkaart
    UIBezierPath* trein1PathPath;
    UIBezierPath* trein2PathPath;
    UIBezierPath* trein3Path;
    UIBezierPath* trein4Path;
    UIBezierPath* trein5Path;
    UIBezierPath* trein6Path;
    UIBezierPath* trein7Path;
    UIBezierPath* trein8Path;
    UIBezierPath* trein9Path;
    UIBezierPath* trein10Path;
    UIBezierPath* trein11Path;
    UIBezierPath* trein12Path;
    UIBezierPath* trein13Path;
    UIBezierPath* trein14Path;
    UIBezierPath* trein15Path;
    UIBezierPath* trein16Path;
    UIBezierPath* trein17Path;
    UIBezierPath* trein18Path;
    UIBezierPath* trein19Path;
    UIBezierPath* trein20Path;
    
    //De timer die elke 0.01 sec de tijd vooruit laat gaan
    NSTimer *autoplayTimer;
    bool isPlaying;
    
    //Identifier van de zoomlevel (1 = klein, 2 = middel, 3 = groot)
    int levelId;

    IBOutlet UIButton *playButton;
    
    //De paden van de treinen op het Medium scherm
    UIBezierPath* trein1MediumPath;
    UIBezierPath* trein2MediumPath;
    UIBezierPath* trein3MediumPath;
    UIBezierPath* trein4MediumPath;
    UIBezierPath* trein5MediumPath;
    
    //De drie rode cirkels die langzaam vergroten
    CAShapeLayer *circleLayer;
    CAShapeLayer *circleLayer2;
    CAShapeLayer *circleLayer3;

    IBOutlet UIView *closeupView1;
    
    //De slider voor de tijd
    IBOutlet UISlider *timeSlider;
    
    //De buitenste container voor de zoom buttons
    IBOutlet UIView *levelView;
    IBOutlet UIView *sliderView;
    
    //Integer voor de tijd
    int timeInt;
    
    //Zoom buttons
    IBOutlet UIButton *zoomInButton;
    IBOutlet UIButton *zoomOutButton;
}
- (IBAction)playPause:(id)sender;
- (IBAction)zoomIn:(id)sender;
- (IBAction)zoomOut:(id)sender;

@end
