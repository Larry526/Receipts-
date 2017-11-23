//
//  DataHandler.m
//  Receipts++
//
//  Created by Larry Luk on 2017-11-23.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "DataHandler.h"

@interface DataHandler()

@property (nonatomic, weak) AppDelegate *delegate;
@property (nonatomic) NSManagedObjectContext *context;
@end



@implementation DataHandler

-(instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        self.context = self.delegate.persistentContainer.viewContext;
        [self setupCategories];
    }
    
    return self;
}

- (void)setupCategories {
    // do a count fetch on the context using Tag as the entity name
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSUInteger count = [self.context countForFetchRequest:request error:nil];
    // if it's zero then you have to create the categories
    
    if (count == 0) {
        // create the categories
        [self createCategories];
        // and save them
    }
    // fetch the categories using a sort on the name to the tags array
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"tagName" ascending:YES];
    request.sortDescriptors = @[descriptor];
    NSArray <Tag*>*tags = [self.context executeFetchRequest:request error:nil];
    self.tags = tags;
}

- (void)createCategories {
    Tag *tag1 = [[Tag alloc] initWithContext:self.context];
    tag1.tagName = @"Personal";
    [self.delegate saveContext];
}

-(void)saveReceipt:(NSDictionary *)dict {
    Receipt *receipt = [[Receipt alloc]initWithContext:self.context];
    receipt.note = dict[@"note"];
    receipt.amount = dict[@"amount"];
    receipt.timestamp = dict[@"timeStamp"];
    NSArray <Tag*>*selectedTags = dict[@"tags"];
    receipt.tags = [NSSet setWithArray:selectedTags];
    [self.delegate saveContext];
}





@end
