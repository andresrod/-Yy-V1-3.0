//
//  MasterViewController.m
//  corral1
//
//  Created by Andres Rodriguez on 12-12-21.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewControllerB.h"
#import "DetailViewControllerFries.h"

#import "OrderController.h"
#import "Process.h"
#import "Burger.h"
#import "Fries.h"
/*
@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end
*/
@implementation MasterViewController {
    NSData* receivedData;
    UILabel* requestStatus;
    Process* processView;

}




- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
    self.dataController = [[OrderController alloc] init];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 /*   self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
*/
    UIImageView *backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];

    [self.tableView setBackgroundView:backView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    static NSString *CellLabel;
    id orderItem = [self.dataController objectInListAtIndex:indexPath.row];
    if ([orderItem isKindOfClass:[Burger class]]) {
        CellIdentifier = @"BurgerCell";
        CellLabel = @"Hamburguesa";
    }
    else if ([orderItem isKindOfClass:[Fries class]]) {
 //   static NSString *CellIdentifier = @"BurgerCell";
  //  if ([orderItem isKindOfClass:[Fries class]]) {
        CellIdentifier = @"FriesCell";
        CellLabel = @"Papas";
    }
    else {
//    if ([orderItem isKindOfClass:[NSObject class]]) {
        CellIdentifier = @"AddCell";
        CellLabel = @"Adicionar";
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
 //   Burger *burgerAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:CellLabel];
 //   [[cell detailTextLabel] setText:@"ketchup"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDate *object = _objects[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowItemDetails"]) {
        id orderItem = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        if ([orderItem isKindOfClass:[Burger class]]) {
            DetailViewControllerB *detailViewController = [segue destinationViewController];
        
            detailViewController.orderItem = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        }
        
        if ([orderItem isKindOfClass:[Fries class]]) {
            DetailViewControllerFries *detailViewController = [segue destinationViewController];
            
            detailViewController.orderItem = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        }
    }
}



- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        AddItemController *addController = [segue sourceViewController];
        if (addController.burgerItem) {
            [self.dataController addOrderItemWithBurger:addController.burgerItem];
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


- (IBAction)doneFries:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        AddItemControllerFries *addController = [segue sourceViewController];
        if (addController.friesItem) {
            [self.dataController addOrderItem:addController.friesItem];
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)process:(id)sender;
{
    [self postTest];
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"send" bundle:nil];
    processView = [storyboard instantiateInitialViewController];
    
    processView.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:processView animated:YES];
    processView.status.text =@"sending";
}


-(void)postTest{
   
/*    NSDictionary* info = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"name",
                          @"who",
                          @"country",
                          @"where",
                          @"2",
                          @"what",
                          nil];
 */
    NSDictionary* info = [self.dataController serialize];
   // NSDictionary* info = [info_ objectAtIndex:0];
    //convert object to data
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:info 
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    for (id key in info) {
        for (id key2 in [info objectForKey:key]) {
            NSLog(@"key: %@, value: %@ \n", key2, [[info objectForKey:key] objectForKey:key2]);
        }
    }
    //build up the request that is to be sent to the server
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.looparound.co/play/ff.php"]];
    
    [request setHTTPMethod:@"POST"];
    [request addValue:@"postValues" forHTTPHeaderField:@"METHOD"];
    
    //create data that will be sent in the post
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:@"2" forKey:@"value1"];
    [dictionary setValue:@"This was sent from ios to server" forKey:@"value2"];
    
    //serialize the dictionary data as json
    //NSData *data = [[dictionary copy] JSONValue];
 /*   NSDictionary* ff = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"name",
                        @"who",
                        @"country",
                        @"where",
                        @"2",
                        @"what",
                        nil];
 */
    
    NSData* data= [NSJSONSerialization dataWithJSONObject:info options:kNilOptions error:NULL];
    
    [request setHTTPBody:data]; //set the data as the post body
    [request addValue:[NSString stringWithFormat:@"%d",data.length] forHTTPHeaderField:@"Content-Length"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(!connection){
        NSLog(@"Connection Failed");
    }
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{ // executed when the connection receives data
    
    receivedData = data;
    /* NOTE: if you are working with large data , it may be better to set recievedData as NSMutableData
     and use  [receivedData append:Data] here, in this event you should also set recievedData to nil
     when you are done working with it or any new data received could end up just appending to the
     last message received*/
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSLog(@"Request Complete,recieved %d bytes of data",receivedData.length);
    
    [self requestReturnedData:receivedData];//send the data to the delegate
}

-(void) requestReturnedData:(NSData *) data
{
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
    processView.status.text = @"sent OK";
    
}




@end
