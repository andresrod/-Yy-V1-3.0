//
//  DetailViewController.m
//  corral1
//
//  Created by Andres Rodriguez on 12-12-21.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import "DetailViewControllerB.h"
#import "Burger.h"
@interface DetailViewControllerB ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewControllerB

#pragma mark - Managing the detail item

- (void)setOrderItem:(Burger *)newOrderItem
{
    if (_orderItem != newOrderItem) {
        _orderItem = newOrderItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    Burger *theItem = self.orderItem;
    

    if (theItem) {

        if (self.orderItem.lettuce) {
            self.lettuceLabel.text = @"Si";
        } else {
            self.lettuceLabel.text = @"No";
        }
            
        if (self.orderItem.tomatoe) {
            self.tomatoeLabel.text = @"Si";
        } else {
            self.tomatoeLabel.text = @"No";
        }
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    UIImageView *backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    
    [self.tableView setBackgroundView:backView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
