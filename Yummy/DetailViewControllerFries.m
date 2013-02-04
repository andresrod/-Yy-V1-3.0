//
//  DetailViewControllerFries.m
//  corral1
//
//  Created by Andres Rodriguez on 12-12-26.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import "DetailViewControllerFries.h"
#import "Fries.h"
@interface DetailViewControllerFries ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewControllerFries


#pragma mark - Managing the detail item

- (void)setOrderItem:(Fries *)newOrderItem
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
    Fries *theItem = self.orderItem;
    
    
    if (theItem) {
        
        if (self.orderItem.salt) {
            self.saltLabel.text = @"Si";
        } else {
            self.saltLabel.text = @"No";
        }
        
        if (self.orderItem.pepper) {
            self.pepperLabel.text = @"Si";
        } else {
            self.pepperLabel.text = @"No";
        }
        
        self.sizeLabel.text = self.orderItem.size;

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
