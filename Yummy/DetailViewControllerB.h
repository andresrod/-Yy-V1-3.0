//
//  DetailViewController.h
//  corral1
//
//  Created by Andres Rodriguez on 12-12-21.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Burger;
@interface DetailViewControllerB : UITableViewController



@property (strong, nonatomic) Burger *orderItem;
@property (weak, nonatomic) IBOutlet UILabel *lettuceLabel;
@property (weak, nonatomic) IBOutlet UILabel *tomatoeLabel;


@end
