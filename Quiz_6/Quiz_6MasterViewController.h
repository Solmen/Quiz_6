//
//  Quiz_6MasterViewController.h
//  Quiz_6
//
//  Created by Samuel Tolkin on 3/28/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FETask.h"

@interface Quiz_6MasterViewController : UITableViewController
{
    NSMutableArray *tasks;
}

@property (nonatomic, strong) FETask *task;

@end
