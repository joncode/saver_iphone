//
//  ViewController.m
//  saver
//
//  Created by Jon Gutwillig on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoalsViewController.h"
#import "Goal.h"

@implementation GoalsViewController 

@synthesize goals;

-(void) dealloc {
    [goals release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [goals count];
}

- (IBAction)refresh {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.goals = [Goal findAllRemote];
    //[self.tableView reloadData];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Goals";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = refreshButton;
    [refreshButton release];
    
    [self refresh];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellId = @"GoalCellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
    Goal *goal = [goals objectAtIndex:indexPath.row];
    cell.textLabel.text = goal.name;
    cell.detailTextLabel.text = goal.amount;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [goals removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [tableView endUpdates];
}



@end
