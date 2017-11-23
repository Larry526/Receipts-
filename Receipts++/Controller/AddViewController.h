//
//  AddViewController.h
//  Receipts++
//
//  Created by Larry Luk on 2017-11-23.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataHandler;


@interface AddViewController : UIViewController
// pass in the context
@property (nonatomic) DataHandler *dataHandler;
@end
