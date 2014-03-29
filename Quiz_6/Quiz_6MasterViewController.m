//
//  Quiz_6MasterViewController.m
//  Quiz_6
//
//  Created by Samuel Tolkin on 3/28/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "Quiz_6MasterViewController.h"

#import "Quiz_6DetailViewController.h"

#import "FETask.h"

@interface Quiz_6MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation Quiz_6MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self setTitle:@"Tasks"];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    NSDate *startDate = [[NSDate alloc]init];
    
    FETask *newTask = [[FETask alloc] initWithName:@"New Task" dueDate:startDate urgency:0];
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
    }


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    FETask *rank = [_objects objectAtIndex:[indexPath row]];
    
    if (rank.urgency == 0) {
        cell.textLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.5];
    }
    else if (rank.urgency <= 4) {
        cell.textLabel.textColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.0 alpha:0.5];
    }
    else if (rank.urgency == 5) {
        cell.textLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.0 alpha:0.5];
    }
    else if (rank.urgency == 9) {
        cell.textLabel.textColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.5];
    }
    else {
        cell.textLabel.textColor = [UIColor colorWithRed:0.7 green:0.4 blue:0.0 alpha:0.5];
    }
    
    [cell.textLabel setText:[rank taskName]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateStyle:NSDateFormatterLongStyle];
    NSString *dateString = [dateFormat stringFromDate:rank.dueDate];
    
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    [format setMaximumFractionDigits:0];
    [format setMinimumFractionDigits:0];
    NSString *result = [format stringFromNumber:[NSNumber numberWithFloat:[rank urgency]]];
    NSString *urgencyString = [NSString stringWithFormat:@"(%@)", result];
    dateString = [dateString stringByAppendingString:urgencyString];
    [cell.detailTextLabel setText:dateString];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.task = _objects[indexPath.row];
    
    Quiz_6DetailViewController *dets = (Quiz_6DetailViewController*) [storyBoard instantiateViewControllerWithIdentifier:@"Details"];
    
    [dets setTask:_task];
    
    dets.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:dets animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
