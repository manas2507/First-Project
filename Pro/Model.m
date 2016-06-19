//
//  Model.m
//  Pro
//
//  Created by Apple on 11/06/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "Model.h"

@implementation Model
-(id)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        self.Title = [dict objectForKey:@"Title"];
        self.plot = [dict objectForKey:@"Plot"];
        self.Year = [dict objectForKey:@"Year"];
    }
    return self;
}



@end
