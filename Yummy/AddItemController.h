//
//  AddItemController.h
//  corral1
//
//  Created by Andres Rodriguez on 12-12-21.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Burger;

@interface AddItemController : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *lettuceSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *tomatoeSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tomatoePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *lettucePicker;



@property (strong, nonatomic) Burger *burgerItem;
@end
