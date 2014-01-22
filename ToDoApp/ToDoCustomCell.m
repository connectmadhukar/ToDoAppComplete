//
//  ToDoCustomCell.m
//  ToDoApp
//
//  Created by Madhukar Mulpuri on 1/19/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import "ToDoCustomCell.h"
#import "ToDoTableViewController.h"

@interface ToDoCustomCell ()
- (IBAction)editingChanged:(id)sender;

@end

@implementation ToDoCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)editingChanged:(id)sender {
    NSLog(@"fEditingChanged");
   
}

@end
