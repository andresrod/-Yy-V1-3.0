//
//  MyCustomViewCell.h
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MyCustomViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@end
