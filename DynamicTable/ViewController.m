//
//  ViewController.m
//  DynamicTable
//
//  Created by Aakash Gupta on 04/04/16.
//  Copyright © 2016 Technosearch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *tableData;
@end

@implementation ViewController

-(void)loadView
{
    [super loadView];
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:true] forKeyPath:@"firstTime"];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:true];

    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"previousData"] != nil) {
        
     self.tableData = [[NSUserDefaults standardUserDefaults] valueForKey:@"previousData"];
    }
    else
    {
        self.tableData = [[NSMutableArray alloc]initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five", nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tableData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    cell.textLabel.text = self.tableData[indexPath.row];
    self.editing = YES;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

}
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath;
{
    return proposedDestinationIndexPath;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *stringToMove = self.tableData[sourceIndexPath.row];
    [self.tableData removeObjectAtIndex:sourceIndexPath.row];
    [self.tableData insertObject:stringToMove atIndex:destinationIndexPath.row];
    [[NSUserDefaults standardUserDefaults] setValue:self.tableData forKey:@
     "previousData"];
    
    NSLog(@"%@",self.tableData);
}
@end
