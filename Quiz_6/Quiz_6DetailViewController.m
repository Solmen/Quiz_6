//
//  Quiz_6DetailViewController.m
//  Quiz_6
//
//  Created by Samuel Tolkin on 3/28/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "Quiz_6DetailViewController.h"
#import "FETask.h"
#import "Quiz_6MasterViewController.h"

@interface Quiz_6DetailViewController ()
- (void)configureView;
@end

@implementation Quiz_6DetailViewController

@synthesize task;

#pragma mark - Managing the detail item

- (void)configureView
{
    if (self.task) {
        [self.taskName setText:[task taskName]];
        [self.date setDate:[task dueDate]];
        [self.taskUrgency setValue:[task urgency]];
        int slideVal = [task urgency];
        [self.urgencyLabel setText:[NSString stringWithFormat:@"Urgency: %d.00", slideVal]];
         
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.taskName.delegate = self;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    [[self view] endEditing:YES];
    [task setTaskName:[_taskName text]];
    [task setDueDate:[_date date]];
    [task setUrgency:[_taskUrgency value]];
    
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self shouldPerformSegueWithIdentifier:@"No" sender:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) valuechanged:(id)sender {
    int sliderVal = [_taskUrgency value];
    [self.urgencyLabel setText:[NSString stringWithFormat:@"Urgency: %d.00", sliderVal]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
