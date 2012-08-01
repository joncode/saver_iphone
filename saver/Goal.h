//
//  Goal.h
//  saver
//
//  Created by Jon Gutwillig on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goal : NSObject {
    NSString *name;
    NSString *amount;
    NSString *goalId;
    NSDate *createdAt;
    NSDate *updatedAt;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *goalId;
@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *updatedAt;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)findAllRemote;


@end
