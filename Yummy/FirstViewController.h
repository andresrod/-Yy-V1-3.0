//
//  FirstViewController.h
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>{
    
    CLLocationManager *locationManager;
    IBOutlet UIImageView *img1;
    IBOutlet UIImageView *img2;
    IBOutlet UIImageView *img3;
    IBOutlet UIScrollView *scroll;
    IBOutlet UIImageView *descUI;
    IBOutlet UITextView *descText;
    BOOL openDesc;
    IBOutlet UIButton *openButton;
}
- (IBAction)moveDescription; 


@end
