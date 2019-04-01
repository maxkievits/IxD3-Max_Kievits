//
//  FinalViewController.m
//  NSTravellers
//
//  Created by Max Kievits on 20/03/2019.
//  Copyright © 2019 MaxMedia-Apps. All rights reserved.
//

#import "FinalViewController.h"
#import <AVFoundation/AVFoundation.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//Dit zijn alle limieten (punten waarop de rode cirkel de treinen raakt van 0.0 tot 1.0)
float train1AnimationLimit = 0.1;
float train2AnimationLimit = 0.208;
float train3AnimationLimit = 0.15;
float train4AnimationLimit = 0.51;
float train5AnimationLimit = 0.73;
float train6AnimationLimit = 0.248;
float train7AnimationLimit = 0.255;
float train8AnimationLimit = 0.607;
float train9AnimationLimit = 0.685;
float train10AnimationLimit = 0.766963;
float train11AnimationLimit = 0.796440;
float train12AnimationLimit = 0.907119;
float train13AnimationLimit = 0.937709;
float train14AnimationLimit = 0.54671;
//float train15AnimationLimit = 1;
float train16AnimationLimit = 0.568965;
float train17AnimationLimit = 0.558954;
float train18AnimationLimit = 0.723026;
float train19AnimationLimit = 0.890990;
float train20AnimationLimit = 0.826474;

float impactPoint = 0.074527;


int totalTime = 10800;

@interface FinalViewController () {
    UIImageView *trein1View;
    UIImageView *trein2View;
    UIImageView *trein3View;
    UIImageView *trein4View;
    UIImageView *trein5View;
    UIImageView *trein6View;
    UIImageView *trein7View;
    UIImageView *trein8View;
    UIImageView *trein9View;
    UIImageView *trein10View;
    UIImageView *trein11View;
    UIImageView *trein12View;
    UIImageView *trein13View;
    UIImageView *trein14View;
    UIImageView *trein15View;
    UIImageView *trein16View;
    UIImageView *trein17View;
    UIImageView *trein18View;
    UIImageView *trein19View;
    UIImageView *trein20View;

    UIImageView *trein1MediumView;
    UIImageView *trein2MediumView;
    UIImageView *trein3MediumView;
    UIImageView *trein4MediumView;
    UIImageView *trein5MediumView;

    //De grote container view voor het middelste zoomlevel
    UIView *mediumView;
    
    //Het scherm met het blauwe cirkeltje voor de persoon op het kleinste zoomlevel (aanrijding)
    UIView *persoonView;
    UIImageView *persoonDotView;

    //cv = Closeup View (Het kleinste scherm (meest ingezoomd) met de treinen en de track)
    UIImageView *cvTrackImageView;
    UIImageView *cvTrackPortalsImageView;
    UIImageView *cvLargeTrainImageView;
}

@end

@implementation FinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    levelId = 1;
    [self levelChanged];
    
    //Het laden van alle treinen
    trein1View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein1View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein1View];
    
    trein2View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein2View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein2View];
    
    trein3View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein3View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein3View];
    
    trein4View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein4View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein4View];
    
    trein5View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein5View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein5View];
    
    trein6View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein6View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein6View];
    
    trein7View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein7View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein7View];
    
    trein8View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein8View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein8View];
    
    trein9View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein9View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein9View];
    
    trein10View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein10View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein10View];
    
    trein11View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein11View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein11View];
    
    trein12View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein12View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein12View];
    
    trein13View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein13View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein13View];
    
    trein14View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein14View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein14View];
    
    //trein15View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    //trein15View.image = [UIImage imageNamed:@"trein_wit"];
    //[self.view addSubview:trein15View];
    
    trein16View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein16View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein16View];
    
    trein17View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein17View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein17View];
    
    trein18View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein18View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein18View];
    
    trein19View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein19View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein19View];
    
    trein20View = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 8)];
    trein20View.image = [UIImage imageNamed:@"trein_wit"];
    [self.view addSubview:trein20View];
    
    mediumView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    UIImageView *mediumImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    mediumImage.image = [UIImage imageNamed:@"spoorkaart_5-medium"];
    [mediumView addSubview:mediumImage];
    [self.view addSubview:mediumView];
    
    //Het laden van alle treinen op het 'Medium' zoomlevel
    trein1MediumView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 78, 24)];
    trein1MediumView.image = [UIImage imageNamed:@"train_medium_white"];
    [mediumView addSubview:trein1MediumView];

    trein2MediumView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 78, 24)];
    trein2MediumView.image = [UIImage imageNamed:@"train_medium_white"];
    [mediumView addSubview:trein2MediumView];

    trein3MediumView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 78, 24)];
    trein3MediumView.image = [UIImage imageNamed:@"train_medium_white"];
    [mediumView addSubview:trein3MediumView];

    trein4MediumView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 78, 24)];
    trein4MediumView.image = [UIImage imageNamed:@"train_medium_white"];
    [mediumView addSubview:trein4MediumView];

    trein5MediumView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 78, 24)];
    trein5MediumView.image = [UIImage imageNamed:@"train_medium_white"];
    [mediumView addSubview:trein5MediumView];

    
    
    cvTrackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 15300)];
    cvTrackImageView.image = [UIImage imageNamed:@"track3"];
    [closeupView1 addSubview:cvTrackImageView];
    
    cvLargeTrainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(398, -10, 78, 253)];
    cvLargeTrainImageView.image = [UIImage imageNamed:@"train_large_white"];
    [closeupView1 addSubview:cvLargeTrainImageView];
    
    persoonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 15300)];
    persoonView.backgroundColor = [UIColor clearColor];
    
    persoonDotView = [[UIImageView alloc] initWithFrame:CGRectMake(425, 5935, 40, 40)];
    persoonDotView.image = [UIImage imageNamed:@"person"];
    [persoonView addSubview:persoonDotView];
    [closeupView1 addSubview:persoonView];
    
    cvTrackPortalsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 15300)];
    cvTrackPortalsImageView.image = [UIImage imageNamed:@"trackPortals"];
    [closeupView1 addSubview:cvTrackPortalsImageView];
    
    
    /*
    mediumView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    mediumView.image = [UIImage imageNamed:@"spoorkaart_5-medium"];
    [self.view addSubview:mediumView];
     */

    
    timeInt = 0;
    
    NSLog(@"%@",NSStringFromCGPoint(timePopupView.center));
    
    //De schaduwen om de knoppen en om de slider (voor betere leesbaarheid)
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:sliderView.bounds];
    sliderView.layer.masksToBounds = NO;
    sliderView.layer.shadowColor = [UIColor blackColor].CGColor;
    sliderView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    sliderView.layer.shadowOpacity = 0.1f;
    sliderView.layer.shadowPath = shadowPath.CGPath;
    
    UIBezierPath *shadowPath2 = [UIBezierPath bezierPathWithRect:levelView.bounds];
    levelView.layer.masksToBounds = NO;
    levelView.layer.shadowColor = [UIColor blackColor].CGColor;
    levelView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    levelView.layer.shadowOpacity = 0.1f;
    levelView.layer.shadowPath = shadowPath2.CGPath;
    
    UIBezierPath *shadowPath3 = [UIBezierPath bezierPathWithRect:playButton.superview.bounds];
    playButton.superview.layer.masksToBounds = NO;
    playButton.superview.layer.shadowColor = [UIColor blackColor].CGColor;
    playButton.superview.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    playButton.superview.layer.shadowOpacity = 0.1f;
    playButton.superview.layer.shadowPath = shadowPath3.CGPath;
    
    autoplayTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateVisual) userInfo:nil repeats:true];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(flashTrains) userInfo:nil repeats:true];
    [playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"play_pressed"] forState:UIControlStateHighlighted];
    
    [autoplayTimer invalidate];
    
    isPlaying = false;
}

//Deze functie wordt elke keer aangeroepen als het scherm een frame moet updaten (door Autoplaytimer)
-(void)updateVisual {
    self->timeSlider.value = self->timeSlider.value + 0.0001;
    [self SliderUpdated:self->timeSlider];
}

//Nadat het scherm is verschenen worden hier alle paden voor de treinen 'getekend'.
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //// trein1Path Drawing
    trein1PathPath = UIBezierPath.bezierPath;
    [trein1PathPath moveToPoint: CGPointMake(578, 355)];
    [trein1PathPath addLineToPoint: CGPointMake(578, 489)];
    
    //// trein2Path Drawing
    trein2PathPath = UIBezierPath.bezierPath;
    [trein2PathPath moveToPoint: CGPointMake(725.5, 325.5)];
    [trein2PathPath addLineToPoint: CGPointMake(657.5, 393.5)];
    [trein2PathPath addLineToPoint: CGPointMake(612.5, 393.5)];
    [trein2PathPath addLineToPoint: CGPointMake(583.5, 421.5)];
    
    trein3Path = UIBezierPath.bezierPath;
    [trein3Path moveToPoint: CGPointMake(527, 609)];
    [trein3Path addLineToPoint: CGPointMake(578, 558)];
    [trein3Path addLineToPoint: CGPointMake(578, 525)];
    
    //// trein4 Drawing
    trein4Path = UIBezierPath.bezierPath;
    [trein4Path moveToPoint: CGPointMake(779.5, 86.5)];
    [trein4Path addLineToPoint: CGPointMake(779.5, 270.5)];
    [trein4Path addLineToPoint: CGPointMake(736.5, 314.5)];
    
    //// trein5 Drawing
    trein5Path = UIBezierPath.bezierPath;
    [trein5Path moveToPoint: CGPointMake(741.5, 35.5)];
    [trein5Path addLineToPoint: CGPointMake(779.5, 74.5)];
    [trein5Path addLineToPoint: CGPointMake(779.5, 190.5)];
    
    //// trein6 Drawing
    trein6Path = UIBezierPath.bezierPath;
    [trein6Path moveToPoint: CGPointMake(537.5, 273.5)];
    [trein6Path addLineToPoint: CGPointMake(577.5, 315.5)];
    [trein6Path addLineToPoint: CGPointMake(577.5, 403.5)];
    
    //// trein7 Drawing
    trein7Path = UIBezierPath.bezierPath;
    [trein7Path moveToPoint: CGPointMake(383, 558)];
    [trein7Path addLineToPoint: CGPointMake(516, 558)];
    
    //// trein8 Drawing
    trein8Path = UIBezierPath.bezierPath;
    [trein8Path moveToPoint: CGPointMake(791, 526)];
    [trein8Path addLineToPoint: CGPointMake(759, 558)];
    [trein8Path addLineToPoint: CGPointMake(759, 585)];
    [trein8Path addLineToPoint: CGPointMake(825, 652)];
    
    //// trein9 Drawing
    trein9Path = UIBezierPath.bezierPath;
    [trein9Path moveToPoint: CGPointMake(579, 315)];
    [trein9Path addLineToPoint: CGPointMake(447, 183)];
    
    //// trein10 Drawing
    trein10Path = UIBezierPath.bezierPath;
    [trein10Path moveToPoint: CGPointMake(336, 205)];
    [trein10Path addLineToPoint: CGPointMake(397, 144)];
    [trein10Path addLineToPoint: CGPointMake(336, 205)];
    [trein10Path closePath];
    
    //// trein11 Drawing
    trein11Path = UIBezierPath.bezierPath;
    [trein11Path moveToPoint: CGPointMake(411, 96)];
    [trein11Path addLineToPoint: CGPointMake(397, 111)];
    [trein11Path addLineToPoint: CGPointMake(397, 145)];
    [trein11Path addLineToPoint: CGPointMake(386, 154)];
    
    //// trein12 Drawing
    trein12Path = UIBezierPath.bezierPath;
    [trein12Path moveToPoint: CGPointMake(391, 76)];
    [trein12Path addLineToPoint: CGPointMake(470, 76)];
    [trein12Path addLineToPoint: CGPointMake(511, 36)];
    
    //// trein13 Drawing
    trein13Path = UIBezierPath.bezierPath;
    [trein13Path moveToPoint: CGPointMake(617, 14)];
    [trein13Path addLineToPoint: CGPointMake(534, 14)];
    [trein13Path addLineToPoint: CGPointMake(521, 25)];
    
    //// trein14 Drawing
    trein14Path = UIBezierPath.bezierPath;
    [trein14Path moveToPoint: CGPointMake(895, 354)];
    [trein14Path addLineToPoint: CGPointMake(827, 423)];
    [trein14Path addLineToPoint: CGPointMake(827, 483)];
    
    //// trein15 Drawing
    //trein15Path = UIBezierPath.bezierPath;
    //[trein15Path moveToPoint: CGPointMake(578, 558)];
    //[trein15Path addLineToPoint: CGPointMake(684, 663)];
    
    //// trein16 Drawing
    trein16Path = UIBezierPath.bezierPath;
    [trein16Path moveToPoint: CGPointMake(578, 558)];
    [trein16Path addLineToPoint: CGPointMake(578, 667)];
    [trein16Path addLineToPoint: CGPointMake(654, 741)];
    
    //// trein17 Drawing
    trein17Path = UIBezierPath.bezierPath;
    [trein17Path moveToPoint: CGPointMake(422, 750)];
    [trein17Path addLineToPoint: CGPointMake(422, 715)];
    [trein17Path addLineToPoint: CGPointMake(487, 649)];
    
    //// trein18 Drawing
    trein18Path = UIBezierPath.bezierPath;
    [trein18Path moveToPoint: CGPointMake(344, 558)];
    [trein18Path addLineToPoint: CGPointMake(304, 597)];
    [trein18Path addLineToPoint: CGPointMake(304, 624)];
    [trein18Path addLineToPoint: CGPointMake(268, 658)];
    
    //// trein19 Drawing
    trein19Path = UIBezierPath.bezierPath;
    [trein19Path moveToPoint: CGPointMake(61, 699)];
    [trein19Path addLineToPoint: CGPointMake(111, 699)];
    [trein19Path addLineToPoint: CGPointMake(158, 743)];
    [trein19Path addLineToPoint: CGPointMake(184, 743)];
    [trein19Path addLineToPoint: CGPointMake(229, 699)];
    
    //// trein20 Drawing
    trein20Path = UIBezierPath.bezierPath;
    [trein20Path moveToPoint: CGPointMake(727, 324)];
    [trein20Path addLineToPoint: CGPointMake(780, 270)];
    [trein20Path addLineToPoint: CGPointMake(780, 136)];


    
    //// trein1Medium Drawing
    trein1MediumPath = UIBezierPath.bezierPath;
    [trein1MediumPath moveToPoint: CGPointMake(523, 31)];
    [trein1MediumPath addLineToPoint: CGPointMake(523, 416)];
    
    
    //// trein2Medium Drawing
    trein2MediumPath = UIBezierPath.bezierPath;
    [trein2MediumPath moveToPoint: CGPointMake(377, 760)];
    [trein2MediumPath addLineToPoint: CGPointMake(524, 614)];
    [trein2MediumPath addLineToPoint: CGPointMake(524, 520)];
    
    
    //// trein3Medium Drawing
    trein3MediumPath = UIBezierPath.bezierPath;
    [trein3MediumPath moveToPoint: CGPointMake(1070, -179)];
    [trein3MediumPath addLineToPoint: CGPointMake(752, 142)];
    [trein3MediumPath addLineToPoint: CGPointMake(621, 142)];
    [trein3MediumPath addLineToPoint: CGPointMake(552, 212)];

    
    //// trein4Medium Drawing
    trein4MediumPath = UIBezierPath.bezierPath;
    [trein4MediumPath moveToPoint: CGPointMake(432, -147)];
    [trein4MediumPath addLineToPoint: CGPointMake(522.75, -51.19)];
    [trein4MediumPath addLineToPoint: CGPointMake(523, 155)];
    
    
    //// trein5Medium Drawing
    trein5MediumPath = UIBezierPath.bezierPath;
    [trein5MediumPath moveToPoint: CGPointMake(-93, 613)];
    [trein5MediumPath addLineToPoint: CGPointMake(341, 613)];
    
    
    [self SliderUpdated:self->timeSlider];
}

//Deze functie wordt elke keer dat de waarde van de slider veradnerd (van 0.0 naar 1.0) aangeroepen
- (IBAction)SliderUpdated:(UISlider *)sender {
    //Hier wordt de positie van alle treinen geupdate met hun limiet (helemaal bovenaan gedefineerd)
    [self updateTrain:trein1View withProgress:sender.value andLimit:impactPoint andPath:trein1PathPath];
    [self updateTrain:trein2View withProgress:sender.value andLimit:train2AnimationLimit andPath:trein2PathPath];
    [self updateTrain:trein3View withProgress:sender.value andLimit:train3AnimationLimit andPath:trein3Path];
    [self updateTrain:trein4View withProgress:sender.value andLimit:train4AnimationLimit andPath:trein4Path];
    [self updateTrain:trein5View withProgress:sender.value andLimit:train5AnimationLimit andPath:trein5Path];
    [self updateTrain:trein6View withProgress:sender.value andLimit:train6AnimationLimit andPath:trein6Path];
    [self updateTrain:trein7View withProgress:sender.value andLimit:train7AnimationLimit andPath:trein7Path];
    [self updateTrain:trein8View withProgress:sender.value andLimit:train8AnimationLimit andPath:trein8Path];
    [self updateTrain:trein9View withProgress:sender.value andLimit:train9AnimationLimit andPath:trein9Path];
    [self updateTrain:trein10View withProgress:sender.value andLimit:train10AnimationLimit andPath:trein10Path];
    [self updateTrain:trein11View withProgress:sender.value andLimit:train11AnimationLimit andPath:trein11Path];
    [self updateTrain:trein12View withProgress:sender.value andLimit:train12AnimationLimit andPath:trein12Path];
    [self updateTrain:trein13View withProgress:sender.value andLimit:train13AnimationLimit andPath:trein13Path];
    [self updateTrain:trein14View withProgress:sender.value andLimit:train14AnimationLimit andPath:trein14Path];
    //[self updateTrain:trein15View withProgress:sender.value andLimit:train15AnimationLimit andPath:trein15Path];
    [self updateTrain:trein16View withProgress:sender.value andLimit:train16AnimationLimit andPath:trein16Path];
    [self updateTrain:trein17View withProgress:sender.value andLimit:train17AnimationLimit andPath:trein17Path];
    [self updateTrain:trein18View withProgress:sender.value andLimit:train18AnimationLimit andPath:trein18Path];
    [self updateTrain:trein19View withProgress:sender.value andLimit:train19AnimationLimit andPath:trein19Path];
    [self updateTrain:trein20View withProgress:sender.value andLimit:train20AnimationLimit andPath:trein20Path];

    [self updateMediumTrain:trein1MediumView withProgress:sender.value andLimit:impactPoint andPath:trein1MediumPath];
    [self updateMediumTrain:trein2MediumView withProgress:sender.value andLimit:train3AnimationLimit andPath:trein2MediumPath];
    [self updateMediumTrain:trein3MediumView withProgress:sender.value andLimit:train2AnimationLimit andPath:trein3MediumPath];
    [self updateMediumTrain:trein4MediumView withProgress:sender.value andLimit:train6AnimationLimit andPath:trein4MediumPath];
    [self updateMediumTrain:trein5MediumView withProgress:sender.value andLimit:train7AnimationLimit andPath:trein5MediumPath];


    //[self updateTrain2WithProgress:sender.value];
    timePopupView.center = CGPointMake((868 * sender.value) + 78, timePopupView.center.y);
    
    //timeInt = totalTime * sender.value;
    //int minutes = timeInt / 60;
    //int hours = minutes / 60;
    //timePopupLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes - (hours * 60),timeInt - (minutes * 60)];
    //timePopupLabel.text = @"< TIME >";
    
    //De rode cirkel wordt hier uit het scherm verwijderd en opnieuw gegenereerd
    [circleLayer removeFromSuperlayer];
    [circleLayer2 removeFromSuperlayer];
    [circleLayer3 removeFromSuperlayer];

    circleLayer = [CAShapeLayer layer];
    circleLayer2 = [CAShapeLayer layer];
    circleLayer3 = [CAShapeLayer layer];

    float circleSize = [self mapFloatWithInput:sender.value inMin:train1AnimationLimit inMax:1 outMin:0 outMax:1];
    
    float downspeedFloat = 1;
    if (sender.value >= impactPoint && sender.value <= train1AnimationLimit) {
        downspeedFloat = [self mapFloatWithInput:sender.value inMin:impactPoint inMax:train1AnimationLimit outMin:1 outMax:0];
        NSLog(@"DOWN: %f",downspeedFloat);
    } else if(sender.value < 0.074527) {
        downspeedFloat = 1.0f;
    } else {
        downspeedFloat = 0.0f;
    }
    
    //Het animeren van het spoor en de aanrijding
    float personProgress = [self mapFloatWithInput:sender.value inMin:0 inMax:impactPoint outMin:1 outMax:0];
    if (sender.value >= impactPoint) {
        cvLargeTrainImageView.image = [UIImage imageNamed:@"train_large_red"];
        persoonDotView.center = CGPointMake(420 - (1000 * 0), persoonDotView.center.y);
        persoonDotView.hidden = true;
    } else {
        cvLargeTrainImageView.image = [UIImage imageNamed:@"train_large_white"];
        persoonDotView.center = CGPointMake(420 - (1000 * personProgress), persoonDotView.center.y);
        persoonDotView.hidden = false;
    }
    
    if (sender.value <= train1AnimationLimit) {
        float closeupTrackProgress = ([self mapFloatWithInput:sender.value inMin:0 inMax:train1AnimationLimit outMin:1 outMax:0]);
        
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self->cvTrackImageView.center = CGPointMake(self->cvTrackImageView.center.x,((self->cvTrackImageView.frame.size.height - (self->cvTrackImageView.frame.size.height / 2)) * closeupTrackProgress) * downspeedFloat);
            
            self->cvTrackPortalsImageView.center = CGPointMake(self->cvTrackPortalsImageView.center.x,((self->cvTrackPortalsImageView.frame.size.height - (self->cvTrackPortalsImageView.frame.size.height / 2)) * closeupTrackProgress) * downspeedFloat);
            
            self->persoonView.center = CGPointMake(self->persoonView.center.x,((self->persoonView.frame.size.height - (self->persoonView.frame.size.height / 2)) * closeupTrackProgress) * downspeedFloat);

        } completion:^(BOOL finished) {
            
        }];
        
    } else {
        cvTrackImageView.center = CGPointMake(cvTrackImageView.center.x,(cvTrackImageView.frame.size.height - (cvTrackImageView.frame.size.height / 2)) * 0);
        
        cvTrackPortalsImageView.center = CGPointMake(cvTrackPortalsImageView.center.x,(cvTrackPortalsImageView.frame.size.height - (cvTrackPortalsImageView.frame.size.height / 2)) * 0);
    }
    
    
    //Genereren van de rode cirkels
    if (sender.value >= train1AnimationLimit) {
        [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 1000 * circleSize, 1000 * circleSize)] CGPath]];
        circleLayer.strokeColor = [UIColor redColor].CGColor;
        circleLayer.lineWidth = 2.0f;
        circleLayer.fillColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3].CGColor;
        [[self.view layer] addSublayer:circleLayer];
        circleLayer.position = CGPointMake(568 - ((1000 * circleSize) / 2), 478 - ((1000 * circleSize) / 2));
        
        
        [circleLayer2 setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 3000 * circleSize, 3000 * circleSize)] CGPath]];
        circleLayer2.strokeColor = [UIColor redColor].CGColor;
        circleLayer2.lineWidth = 2.0f;
        circleLayer2.fillColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3].CGColor;
        [[mediumView layer] addSublayer:circleLayer2];
        circleLayer2.position = CGPointMake(512 - ((3000 * circleSize) / 2), 400 - ((3000 * circleSize) / 2));
        
        
        [circleLayer3 setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(cvLargeTrainImageView.center.x, cvLargeTrainImageView.center.y, 20000 * circleSize, 20000 * circleSize)] CGPath]];
        circleLayer3.strokeColor = [UIColor redColor].CGColor;
        circleLayer3.lineWidth = 2.0f;
        circleLayer3.fillColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3].CGColor;
        [[closeupView1 layer] addSublayer:circleLayer3];
        circleLayer3.position = CGPointMake(((cvLargeTrainImageView.center.x / 2) - 220) - ((20000 * circleSize) / 2),  ((cvLargeTrainImageView.center.y / 2) - 100) - ((20000 * circleSize) / 2));
        
        /*
        [circleLayer4 setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 400 * circleSize, 400 * circleSize)] CGPath]];
        circleLayer4.strokeColor = [UIColor redColor].CGColor;
        circleLayer4.lineWidth = 2.0f;
        circleLayer4.fillColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3 * (1 - circleSize)].CGColor;
        [[self.view layer] addSublayer:circleLayer4];
        circleLayer4.position = CGPointMake(568 - ((400 * circleSize) / 2), 478 - ((400 * circleSize) / 2));
         */
    }
    NSLog(@"%f",sender.value);

    [self.view bringSubviewToFront:mediumView];
    [self.view bringSubviewToFront:closeupView1];
    [self.view bringSubviewToFront:sliderView];
    [self.view bringSubviewToFront:timePopupView];
    [self.view bringSubviewToFront:levelView];
    [self.view bringSubviewToFront:playButton.superview];
}

//Dit is de functie die ik zelf heb geschreven voor het updaten van de locatie van de trein aan de hand van het gegeven pad en limiet.
-(void)updateTrain:(UIImageView *)train withProgress:(float)progress andLimit:(float)limit andPath:(UIBezierPath *)path {
    
    // Create and configure a new CAKeyframeAnimation instance
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.0;
    animation.path = path.CGPath;
    animation.speed = 0;
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    animation.removedOnCompletion = NO;
    
    
    if (progress >= limit) {        
        animation.timeOffset = 0.9999;
        train.image = [UIImage imageNamed:@"trein_rood"];
    } else {
        animation.timeOffset = [self mapFloatWithInput:progress inMin:0 inMax:limit outMin:0 outMax:1];
        train.image = [UIImage imageNamed:@"trein_wit"];
    }
    
    // Replace the current animation with a new one having the desired timeOffset
    [train.layer addAnimation:animation forKey:@"LabelPathAnimation"];
}

//Deze functie update ook maar dan alleen voor de treinen op het 'Medium' zoomlevel
-(void)updateMediumTrain:(UIImageView *)train withProgress:(float)progress andLimit:(float)limit andPath:(UIBezierPath *)path {
    
    // Create and configure a new CAKeyframeAnimation instance
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.0;
    animation.path = path.CGPath;
    animation.speed = 0;
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    animation.removedOnCompletion = NO;
    
    
    if (progress >= limit) {
        animation.timeOffset = 0.9999;
        train.image = [UIImage imageNamed:@"train_medium_red"];
    } else {
        animation.timeOffset = [self mapFloatWithInput:progress inMin:0 inMax:limit outMin:0 outMax:1];
        train.image = [UIImage imageNamed:@"train_medium_white"];
    }
    
    // Replace the current animation with a new one having the desired timeOffset
    [train.layer addAnimation:animation forKey:@"LabelPathAnimation"];
}

//Deze functie zorgt ervoor dat de 'probleem-startende' trein rood flitst wanneer de aanrijding plaats heeft gevonden
-(void)flashTrains {
    if ([trein1View.image isEqual:[UIImage imageNamed:@"trein_rood"]]) {
        if (trein1View.alpha == 1.0f) {
            trein1View.alpha = 0.0f;
        } else {
            trein1View.alpha = 1.0f;
        }
    } else {
        trein1View.alpha = 1.0f;
    }
    
    if ([trein1MediumView.image isEqual:[UIImage imageNamed:@"train_medium_red"]]) {
        if (trein1MediumView.alpha == 1.0f) {
            trein1MediumView.alpha = 0.0f;
        } else {
            trein1MediumView.alpha = 1.0f;
        }
    } else {
        trein1MediumView.alpha = 1.0f;
    }
    
    
    if ([cvLargeTrainImageView.image isEqual:[UIImage imageNamed:@"train_large_red"]]) {
        if (cvLargeTrainImageView.alpha == 1.0f) {
            cvLargeTrainImageView.alpha = 0.0f;
        } else {
            cvLargeTrainImageView.alpha = 1.0f;
        }
    } else {
        cvLargeTrainImageView.alpha = 1.0f;
    }
}

//Omdat Objective-C geen eigen map functie heeft (zoals ofMap() of map() in Processing) heb ik hem maar zelf moeten schrijven
-(float)mapFloatWithInput:(float)input inMin:(float)inMin inMax:(float)inMax outMin:(float)outMin outMax:(float)outMax {
    return outMin + (outMax - outMin) * (input - inMin) / (inMax - inMin);
}
- (IBAction)sliderTouched:(id)sender {
    [autoplayTimer invalidate];
    /*
    timePopupView.alpha = 0.0f;
    timePopupView.hidden = false;
    [UIView animateWithDuration:0.3 animations:^{
        self->timePopupView.alpha = 1.0f;
    }];
     */
}
- (IBAction)sliderReleased:(id)sender {
    if (isPlaying) {
        autoplayTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateVisual) userInfo:nil repeats:true];
    }
    /*
    timePopupView.alpha = 1.0f;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:false block:^(NSTimer * _Nonnull timer) {
        [UIView animateWithDuration:0.3 animations:^{
            self->timePopupView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            self->timePopupView.hidden = true;
        }];
    }];
    */
    /* Use this code to play an audio file */
}

//Wanneer het zoomniveau verandert
-(void)levelChanged {
    NSLog(@"LEVEL: %d",levelId);
    if (levelId == 1) {
        closeupView1.hidden = false;
        mediumView.hidden = true;
        
        zoomInButton.enabled = false;
        zoomOutButton.enabled = true;
    }
    if (levelId == 2) {
        closeupView1.hidden = true;
        mediumView.hidden = false;
        
        zoomInButton.enabled = true;
        zoomOutButton.enabled = true;
    }
    if (levelId == 3) {
        closeupView1.hidden = true;
        mediumView.hidden = true;
        
        zoomInButton.enabled = true;
        zoomOutButton.enabled = false;
    }
}

//Deze functie wordt aangeroepen als de Play/Pause knop word ingedrukd
- (IBAction)playPause:(id)sender {
    if (isPlaying) {
        
        [playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"play_pressed"] forState:UIControlStateHighlighted];

        [autoplayTimer invalidate];
        
        isPlaying = false;
    } else {
        
        [playButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"pause_pressed"] forState:UIControlStateHighlighted];

        autoplayTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateVisual) userInfo:nil repeats:true];

        isPlaying = true;
    }
}

//Zoom In button
- (IBAction)zoomIn:(id)sender {
    if (levelId == 1) {
        levelId = 1;
    }
    else if (levelId == 2) {
        levelId = 1;
    }
    else if (levelId == 3) {
        levelId = 2;
    }
    [self levelChanged];
}

//Zoom Out button
- (IBAction)zoomOut:(id)sender {
    if (levelId == 1) {
        levelId = 2;
    }
    else if (levelId == 2) {
        levelId = 3;
    }
    else if (levelId == 3) {
        levelId = 3;
    }
    [self levelChanged];
}

@end
