//
//  Fries.h
//  corral1
//
//  Created by Andres Rodriguez on 12-12-26.
//  Copyright (c) 2012 yummy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fries : NSObject

@property (readwrite) BOOL salt;
@property (readwrite) BOOL pepper;
@property (readonly) NSString *itemType;
@property (readonly) NSString *size;

-(id) initWithSalt: (BOOL)salt
              pepper: (BOOL)pepper
              size: (NSString*)size;


-(id) serialize;

@end
