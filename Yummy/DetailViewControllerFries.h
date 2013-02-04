//
//  DetailViewControllerFries.h
//  corral1
//
//  Created by Andres Rodriguez on 12-12-26.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Fries;
@interface DetailViewControllerFries : UITableViewController

@property (strong, nonatomic) Fries *orderItem;
@property (weak, nonatomic) IBOutlet UILabel *saltLabel;
@property (weak, nonatomic) IBOutlet UILabel *pepperLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@end
