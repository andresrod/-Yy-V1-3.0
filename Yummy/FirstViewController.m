//
//  FirstViewController.m
//

#import "FirstViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // locationManager update as location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    
    img1.image = [UIImage imageNamed:@"1.png"];
    img2.image = [UIImage imageNamed:@"2.png"];
    img3.image = [UIImage imageNamed:@"3.png"];
    
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(960, 195)];
    
    [openButton setTitle:@"¿Qué es Yummy?" forState:UIControlStateNormal];
    descText.text = @"Yummy es la nueva forma de hacer pedidos en linea. Ólvidate de filas, de esperas, del cambio. Solo Ordena tu comida desde el celular y llega a reclamarla al restaurante.";
    
    // TabBar Configuration
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    
    
    [item0 setTitle:@"Bienvenido"];
    [item1 setTitle:@"Restaurantes"];
    [item2 setTitle:@"Mapa"];
    
    
    UIImage *selectedImage0 = [UIImage imageNamed:@"53-house_sel.png"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"53-house.png"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"178-city_sel.png"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"178-city.png"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"103-map_sel.png"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"103-map.png"];
    
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];
    
    [[[self tabBarController] tabBar] setBackgroundImage:[UIImage imageNamed:@"tabbar.png"]];
    [[[self tabBarController] tabBar] setSelectionIndicatorImage:[UIImage imageNamed:@"clearcolor.png"]];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor blackColor] }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor darkGrayColor] }
                                             forState:UIControlStateHighlighted];
    // TabBar Configuration End
}
- (IBAction)moveDescription
{
if (openDesc) {
        [openButton setTitle:@"¿Qué es?" forState:UIControlStateNormal];
        [scroll setScrollEnabled:YES];
        [UIView beginAnimations:nil context:NULL]; //starting Animation
        
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationRepeatCount:0];
        
        descUI.center = CGPointMake(descUI.center.x, descUI.center.y - 170);
        descText.center = CGPointMake(descText.center.x, descText.center.y - 170);
        [UIView commitAnimations];
    } else {
        [openButton setTitle:@"Cerrar" forState:UIControlStateNormal];
        [scroll setScrollEnabled:NO];
        [UIView beginAnimations:nil context:NULL]; //starting Animation
        
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationRepeatCount:0];
        
        descUI.center = CGPointMake(descUI.center.x, descUI.center.y + 170);
        descText.center = CGPointMake(descText.center.x, descText.center.y + 170);
        [UIView commitAnimations];
        
        [scroll scrollRectToVisible:descUI.frame animated:YES];
    }
  
    openDesc = !openDesc;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
