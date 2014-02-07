//
//  DCSListViewController.m
//  iOSLecture
//
//  Created by Audrey Manzano on 2/6/14.
//  Copyright (c) 2014 Audrey Manzano. All rights reserved.
//

#import "DCSListViewController.h"
#import "DCSToDoItem.h"
#import "DCSViewController.h"

@interface DCSListViewController ()

@end

@implementation DCSListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData {
    DCSToDoItem *item1 = [[DCSToDoItem alloc] init];
    item1.itemName = @"Review for CS 145";
    [self.toDoItems addObject:item1];
    DCSToDoItem *item2 = [[DCSToDoItem alloc] init];
    item2.itemName = @"Read Naruto";
    [self.toDoItems addObject:item2];
    DCSToDoItem *item3 = [[DCSToDoItem alloc] init];
    item3.itemName = @"Watch TV";
    [self.toDoItems addObject:item3];
    DCSToDoItem *item4 = [[DCSToDoItem alloc] init];
    item4.itemName = @"Check Facebook";
    [self.toDoItems addObject:item4];
    DCSToDoItem *item5 = [[DCSToDoItem alloc] init];
    item5.itemName = @"Read Intro to iOS";
    [self.toDoItems addObject:item5];
    DCSToDoItem *item6 = [[DCSToDoItem alloc] init];
    item6.itemName = @"Finish CS 150 MP";
    [self.toDoItems addObject:item6];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    DCSViewController *source = [segue sourceViewController];
    DCSToDoItem *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
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
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    DCSToDoItem *item = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = item.itemName;
    
    if (item.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell...
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    DCSToDoItem *selectedItem = [self.toDoItems objectAtIndex:indexPath.row];
    selectedItem.completed = !selectedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
