//
//  DetailViewController.m
//
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DetailViewController.h"
#import "DisplayMap.h"


@implementation DetailViewController
@synthesize name,number,address,store,distance;
@synthesize mapView;
@synthesize locationManager;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.navigationItem.title = store.name;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    self.locationManager.distanceFilter = 10; // or whatever
    [self.locationManager startUpdatingLocation];
    
    mapView.transform = CGAffineTransformMakeRotation(-0.05);
    mapView.layer.shadowColor = [UIColor grayColor].CGColor;
    mapView.layer.shadowOpacity = 0.8;
    mapView.layer.shadowRadius = 1;
    mapView.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    
    
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(320, 440)];
 
    self.name.text            = store.name;
    self.address.text         = store.address;
    self.number.text          = store.number;

    telNumber = store.number;

    
    [mapView setMapType:MKMapTypeStandard];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
    [mapView setDelegate:self];
    
    double lat = [store.latitude doubleValue];
    double lon = [store.longitude doubleValue];
    CLLocationCoordinate2D coord = { lat, lon };

    
    MKCoordinateRegion region;
    region.center.latitude = lat;
    region.center.longitude = lon;
    region.span.longitudeDelta = 1;
    region.span.latitudeDelta = 1;
    [mapView setRegion:region animated:YES];
    [mapView setCenterCoordinate:region.center animated:YES];
	
	
	DisplayMap *ann = [[DisplayMap alloc] init];
    ann.title = store.name;
	ann.subtitle = store.address;
    ann.coordinate = coord;
	[mapView addAnnotation:ann];
    mapView.showsUserLocation= YES;
    
    
    CLLocation *userloc = [[CLLocation alloc] initWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude];
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:lat longitude:lon];

    CLLocationDistance distance2 = [userloc distanceFromLocation:loc]/ 1000;
    NSLog(@"%f",distance2);
    
    [distance setText:[NSString stringWithFormat:@"%.2f km", distance2]];
}


-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
(id <MKAnnotation>)annotation {
	MKPinAnnotationView *pinView = nil;
	if(annotation != mapView.userLocation)
	{
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        
        
		pinView.pinColor = MKPinAnnotationColorRed;
		pinView.canShowCallout = YES;
		pinView.animatesDrop = YES;
    }
	else {
		[mapView.userLocation setTitle:@"Estoy aquí"];
	}
	return pinView;
}

-(IBAction)buttonPressed:(id)sender
{
    // locationManager update as location
    
    double lat = [store.latitude doubleValue];
    double lon = [store.longitude doubleValue];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    CLLocation *location = [locationManager location];
    
    // Configure the new event with information from the location
    CLLocationCoordinate2D coordinate = [location coordinate];
    CLLocationCoordinate2D destination = { lat, lon };
    
    NSString *googleMapsURLString = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%1.6f,%1.6f&daddr=%1.6f,%1.6f",
                                     coordinate.latitude, coordinate.longitude, destination.latitude, destination.longitude];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:googleMapsURLString]];
    
    
}
- (IBAction)call {
    
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",telNumber]]];
  
}
-(IBAction)showPicker:(id)sender
{
	// This sample can run on devices running iPhone OS 2.0 or later  
	// The MFMailComposeViewController class is only available in iPhone OS 3.0 or later. 
	// So, we must verify the existence of the above class and provide a workaround for devices running 
	// earlier versions of the iPhone OS. 
	// We display an email composition interface if MFMailComposeViewController exists and the device can send emails.
	// We launch the Mail application on the device, otherwise.
	
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet];
		}
	}
	
}
-(void)displayComposerSheet 
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"Prueba"];
	
    
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:@"cs@camilosoler.com"];
    
	
	[picker setToRecipients:toRecipients];
	
	// Attach an image to the email
	// NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"png"];
    // NSData *myData = [NSData dataWithContentsOfFile:path];
	// [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"rainy"];
	
	// Fill out the email body text
    
    
	NSString *emailBody = [NSString stringWithFormat: @"Mensaje..."];
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
    
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	


	[self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setName:nil];
    [self setNumber:nil];
    [self setAddress:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)placeOrder{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"ff" bundle:nil];
    UIViewController* initialHelpView = [storyboard instantiateInitialViewController];
    
    initialHelpView.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:initialHelpView animated:YES];
}

- (IBAction)doneOrder:(UIStoryboardSegue *)segue
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
