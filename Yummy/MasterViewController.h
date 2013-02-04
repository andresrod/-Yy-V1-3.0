//
//  MasterViewController.h
//  corral1
//
//  Created by Andres Rodriguez on 12-12-21.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemController.h"
#import "AddItemControllerFries.h"

@class DetailViewController;
@class OrderController;
@interface MasterViewController : UITableViewController
@property (strong, nonatomic) OrderController *dataController;
//@property (strong, nonatomic) DetailViewController *detailViewController;

- (IBAction)process:(id)sender;
- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;
- (IBAction)doneOrder:(UIStoryboardSegue *)segue;
@end
