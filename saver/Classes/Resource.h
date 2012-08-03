//
//  Resource.h
//  saver
//
//  Created by Jon Gutwillig on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resource : NSObject {
    
}

+ (NSString *)get:(NSString *)url;
+ (NSString *)post:(NSString *)body to:(NSString *)url;
+ (NSString *)put:(NSString *)body to:(NSString *)url;
+ (NSString *)delete:(NSString *)url;

@end
