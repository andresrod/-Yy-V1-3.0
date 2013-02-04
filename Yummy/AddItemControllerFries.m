//
//  AddItemControllerFries.m
//  corral1
//
//  Created by Andres Rodriguez on 12-12-26.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import "AddItemControllerFries.h"
#import "Fries.h"
@interface AddItemControllerFries ()

@end

@implementation AddItemControllerFries

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIImageView *backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    
    [self.tableView setBackgroundView:backView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source






/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        /*        if ([self.birdNameInput.text length] || [self.locationInput.text length]) {
         BirdSighting *sighting;
         NSDate *today = [NSDate date];
         sighting = [[BirdSighting alloc] initWithName:self.birdNameInput.text location:self.locationInput.text date:today];
         self.birdSighting = sighting;
         }
         */
        Fries *friesItem0;
        NSArray *sizeArray = [NSArray arrayWithObjects:@"S",@"M",@"L", nil];
        NSString *size = [sizeArray objectAtIndex:self.sizePicker.selectedSegmentIndex];
        friesItem0 = [[Fries alloc] initWithSalt:(self.saltPicker.selectedSegmentIndex==0)
                                              pepper:(self.saltPicker.selectedSegmentIndex==0)
                                                size:size];
        self.friesItem = friesItem0;
        
    }
}


@end
