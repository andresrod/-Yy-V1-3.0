//
//  MapViewController.h
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class DisplayMap;

@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,MBProgressHUDDelegate> {
    	MBProgressHUD *HUD;
    MKMapView *mapView;
    IBOutlet UIButton *indicazioni;
    CLLocationManager *locationManager;
    IBOutlet UIImageView *img;
}
@property (nonatomic, strong) NSArray *contatti;

@property (nonatomic) UIButton *indicazioni;
@property (nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;
-(IBAction)buttonPressed:(id)sender;

@end
