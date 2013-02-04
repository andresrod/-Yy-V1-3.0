//
//  Burger.h
//  corral1
//
//  Created by Andres Rodriguez on 12-12-21.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Burger : NSObject

@property (readwrite) BOOL lettuce;
@property (readwrite) BOOL tomatoe;
@property (readonly) NSString *itemType;

-(id) initWithLettuce: (BOOL)lettuce
              tomatoe: (BOOL)tomatoe;
-(id) serialize;


@end
