//
//  ViewController.m
//  saver
//
//  Created by Jon Gutwillig on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalsViewController.h"

@implementation GoalsViewController

@synthesize goals;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Goals";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    NSMutableArray *data = [[NSMutableArray alloc] 
                            initWithObjects:@"iPad", @"Tropical Vacation", @"Charitable Donation", nil];
    self.goals = data;    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [goals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellId = @"GoalCellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
    NSString *goal = [goals objectAtIndex:indexPath.row];
    cell.textLabel.text = goal;
    
    return cell;
}


@end
