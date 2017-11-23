//
//  DataHandler.h
//  Receipts++
//
//  Created by Larry Luk on 2017-11-23.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receipt+CoreDataClass.h"
#import "Tag+CoreDataClass.h"
#import "AppDelegate.h"



@interface DataHandler : NSObject


-(void)saveReceipt:(NSDictionary*)dict;

@property (nonatomic) NSArray<Tag*>*tags;


@end
