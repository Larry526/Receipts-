//
//  MasterViewController.m
//  Receipts++
//
//  Created by Larry Luk on 2017-11-23.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "MasterViewController.h"
#import "DataHandler.h"
#import "AddViewController.h"
#import "Receipt+CoreDataClass.h"
#import "Tag+CoreDataClass.h"
#import "CustomTableViewCell.h"

@interface MasterViewController ()
@property (nonatomic) DataHandler *dataHandler;
@property (nonatomic) NSArray <Tag*>*tags;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO create the handler and grab to property'

    self.dataHandler = [[DataHandler alloc]init];
    [self fetchData];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(fetchData) name:NSManagedObjectContextDidSaveNotification object:nil];
    
}

// create a prepareForSegue method and send the handler to the AddViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addReceipt"]) {
        AddViewController *avc = segue.destinationViewController;
        avc.dataHandler = self.dataHandler;
    }
}

-(void)fetchData {
    self.tags = [self.dataHandler fetchData];
    [self.tableView reloadData];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tags.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags[section].receipts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Tag *tag = self.tags[indexPath.section];
    Receipt *receipt = tag.receipts[indexPath.row];
    cell.descriptionLabel.text = receipt.note;
    cell.amountLabel.text = receipt.amount;

    return cell;
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.tags[section].tagName;
}

@end
