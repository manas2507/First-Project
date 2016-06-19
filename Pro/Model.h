//
//  Model.h
//  Pro
//
//  Created by Apple on 11/06/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (strong, nonatomic) NSString *Title;
@property (strong, nonatomic) NSString *plot;
@property (strong, nonatomic) NSString *Year;

-(id)initWithDict:(NSDictionary*)dict;

@end
