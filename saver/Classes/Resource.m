//
//  Resource.m
//  saver
//
//  Created by Jon Gutwillig on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Resource.h"

@interface Resource ()
+ (NSString *)sendBy:(NSString *)method to:(NSString *)url withBody:(NSString *)body;
+ (NSString *)sendRequest:(NSMutableURLRequest *)request;
@end

@implementation Resource

+ (NSString *)get:(NSString *)url {
    return [self sendBy:@"GET" to:url withBody:nil];
}
+ (NSString *)post:(NSString *)body to:(NSString *)url {
    return [self sendBy:@"POST" to:url withBody:body];    
}
+ (NSString *)put:(NSString *)body to:(NSString *)url {
    return [self sendBy:@"PUT" to:url withBody:body];    
}
+ (NSString *)delete:(NSString *)url {
    return [self sendBy:@"DELETE" to:url withBody:nil];    
}

#pragma mark -
#pragma mark Private

+ (NSString *)sendBy:(NSString *)method to:(NSString *)url withBody:(NSString *)body {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    if (body) {
        [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
         [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    return [self sendRequest:request];
}

+ (NSString *)sendRequest:(NSMutableURLRequest *)request {
    NSHTTPURLResponse *response;
    NSError *error;
    
    NSData *responseData = 
    [NSURLConnection sendSynchronousRequest:request 
                          returningResponse:&response 
                                      error:&error];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    [responseString autorelease];
    
    NSLog(@"%@ : %@", [request HTTPMethod], [request URL]);
    NSLog(@"Response Code : %d", [response statusCode]);
    NSLog(@"Content-Type : %@", [[response allHeaderFields] objectForKey:@"Content-Type"] );
    NSLog(@"Response : %@\n\n", responseString);
    
    return responseString;
}


@end
