//
//  FETask.m
//  Quiz5FromEmpty
//
//  Created by Michael Toth on 3/16/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "FETask.h"

@implementation FETask

- (id) initWithName:(NSString *)taskName dueDate:(NSDate *)dueDate urgency:(float)urgency
{
    self = [super init];
    
    if(self) {
        [self setTaskName:taskName];
        [self setUrgency:urgency];
        [self setDueDate:dueDate];
    }
    
    return self;
}

@end
