//
//  ItemizedListTableViewController.m
//  BillSplitter
//
//  Created by Matt Weems on 26/02/2015.
//  Copyright (c) 2015 Matt Weems. All rights reserved.
//

#import "ItemizedListTableViewController.h"
#import "OrderedItem.h"

@interface ItemizedListTableViewController ()
@property NSMutableArray *bill;

@end

@implementation ItemizedListTableViewController

- (void)loadInitialData {
    OrderedItem *item1 = [[OrderedItem alloc]init];
    item1.itemName = @"Guinness";
    item1.price = 4.5;
    item1.completed = NO;
    [self.bill addObject:item1];
    OrderedItem *item2 = [[OrderedItem alloc]init];
    item2.itemName = @"Fried Calimari";
    item2.price = 5.5;
    item2.completed = NO;
    [self.bill addObject:item2];
    OrderedItem *item3 = [[OrderedItem alloc]init];
    item3.itemName = @"Steak and Ale Pie";
    item3.price = 10;
    item3.completed = NO;
    [self.bill addObject:item3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bill = [[NSMutableArray alloc]init];
    [self loadInitialData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.bill count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecieptPrototypeCell" forIndexPath:indexPath];
    OrderedItem *currentItem = [self.bill objectAtIndex:indexPath.row];
    NSString * label = [[NSString alloc] initWithFormat:@"£%d - %@", currentItem.price, currentItem.itemName];
    cell.textLabel.text = label;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    OrderedItem *tappedItem = [self.bill objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
