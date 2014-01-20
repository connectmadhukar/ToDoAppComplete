//
//  ToDoTableViewController.m
//  ToDoApp
//
//  Created by Madhukar Mulpuri on 1/19/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import "ToDoTableViewController.h"
#import "ToDoCustomCell.h"


@interface ToDoTableViewController ()

@end

@implementation ToDoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.toDoArray = [NSMutableArray array];
        [self.toDoArray addObject:@"Eat BreakFast"];
        [self.toDoArray addObject:@"go to gym"];
        [self.toDoArray addObject:@""];
        self.title=@"To Do List";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *toDoCustomCellNib = [UINib nibWithNibName:@"ToDoCustomCell" bundle:nil];
    [self.tableView registerNib:toDoCustomCellNib forCellReuseIdentifier:@"ToDoCustomCell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)loadView
{
    [super loadView];
    /*
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.toDoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ToDoCustomCell";
    ToDoCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.toDoItem.text = [self.toDoArray objectAtIndex:indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"commitEditingStyle pressed %ld", indexPath.row);

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoArray removeObjectAtIndex:indexPath.row];        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"UITableViewCellEditingStyleInsert pressed %ld. DataStore size: %ld", indexPath.row, [self.toDoArray count] );
        //static NSString *CellIdentifier = @"ToDoCustomCell";
        ToDoCustomCell *toDoCustomCell = (ToDoCustomCell *)[tableView cellForRowAtIndexPath:indexPath];
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        [self.toDoArray removeLastObject];
        [self.toDoArray addObject:toDoCustomCell.toDoItem.text];
        [self.toDoArray addObject:@""];
        [self.tableView reloadData];
        NSLog(@"UITableViewCellEditingStyleInsert pressed %ld. DataStore size: %ld", indexPath.row, [self.toDoArray count] );
    }   
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[[UIApplication sharedApplication] delegate]];
    
    if (indexPath.row == [self.toDoArray count]-1) {
        
        return UITableViewCellEditingStyleInsert;
        
    } else {
        
        return UITableViewCellEditingStyleDelete;
        
    }
    
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
    NSLog(@"moveRowAtIndexPath item from %ld to %ld", fromIndexPath.row, toIndexPath.row);
    long from = fromIndexPath.row;
    long to = toIndexPath.row;
    if (to != from && to != self.toDoArray.count -1 && from != self.toDoArray.count -1 ) {
        id obj = [self.toDoArray objectAtIndex:from];
        //[obj retain];
        [self.toDoArray removeObjectAtIndex:from];
        if (to >= [self.toDoArray count]) {
            [self.toDoArray addObject:obj];
        } else {
            [self.toDoArray insertObject:obj atIndex:to];
        }
        //[obj release];
    } else {
       [self.tableView reloadData];
    }
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( (self.toDoArray.count - 1) == indexPath.row) {
        return NO;
    }
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
