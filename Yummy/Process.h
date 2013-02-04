//
//  Process.h
//  Yummy
//
//  Created by Andres Rodriguez on 13-02-04.
//
//

#import <UIKit/UIKit.h>

@interface Process : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (strong, nonatomic) NSData *data;
@end
