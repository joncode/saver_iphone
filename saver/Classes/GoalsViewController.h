//
//  ViewController.h
//  saver
//
//  Created by Jon Gutwillig on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GoalsViewController : UIViewController
{
    NSMutableArray *goals;
}

@property (nonatomic, retain) NSArray *goals;

-(id)tableView;

@end

