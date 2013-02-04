//
//  DetailViewController.h
//
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "Store.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@class DisplayMap;

@interface DetailViewController : UIViewController<MFMailComposeViewControllerDelegate,MKMapViewDelegate>
{

IBOutlet UIScrollView *scroll;
    NSString *telNumber;
    NSArray *_photos;
    MKMapView *mapView;
    CLLocationManager *locationManager;
    NSString *latitude2;
    NSString *longitude2;

}
@property (strong, nonatomic) Store *store;
@property (nonatomic, strong) NSArray *contatti;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;


- (IBAction)call; 
- (IBAction)showPicker:(id)sender;
-(void)displayComposerSheet;
- (IBAction)placeOrder;
@end
