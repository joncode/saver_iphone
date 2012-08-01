//
//  Goal.m
//  saver
//
//  Created by Jon Gutwillig on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Goal.h"
#import "SBJSON.h"

@implementation Goal 

@synthesize  name;
@synthesize  amount;
@synthesize  goalId;
@synthesize  createdAt;
@synthesize  updatedAt;


-(id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.name = [dictionary valueForKey:@"name"];
        self.amount = [NSString stringWithFormat:@"%@",
                       [dictionary valueForKey:@"amount"]];
        self.goalId = [dictionary valueForKey:@"id"];
        self.createdAt =[dictionary valueForKey:@"created_at"];
        self.updatedAt = [dictionary valueForKey:@"updated_at"]; 
    }
    return self;
}

@end
