//
//  AddViewController.m
//  Receipts++
//
//  Created by Larry Luk on 2017-11-23.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "AddViewController.h"
#import "DataHandler.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UIButton *personalCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *familyCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *businessCheckBox;
@property (assign, nonatomic) BOOL personalChecked;
@property (assign, nonatomic) BOOL familyChecked;
@property (assign, nonatomic) BOOL businessChecked;

@property(nonatomic, retain) NSDate *datePicked;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic) NSMutableSet<Tag *>*selectedTags;

@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.personalChecked = YES;
    self.selectedTags = [[NSMutableSet alloc]init];
    //TODO use the handler's tags property to populate your labels.
    
}
// Date Picker

- (IBAction)datePicker:(UIDatePicker *)sender {
    
    self.datePicked = [self.datePicker date];
    NSLog(@"%@", self.datePicked);
    
}

// Checkboxes

- (IBAction)personalPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.isSelected) {
        [sender setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        [self.selectedTags addObject:self.dataHandler.tags[2]];
    } else {
        [sender setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [self.selectedTags removeObject:self.dataHandler.tags[2]];
    }
}

- (IBAction)familyPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        [sender setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        [self.selectedTags addObject:self.dataHandler.tags[1]];
    } else {
        [sender setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [self.selectedTags removeObject:self.dataHandler.tags[1]];
    }
}

- (IBAction)businessPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.isSelected) {
        [sender setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        [self.selectedTags addObject:self.dataHandler.tags[0]];
    } else {
        [sender setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [self.selectedTags removeObject:self.dataHandler.tags[0]];
    }
}

- (IBAction)save:(UIBarButtonItem *)sender {
    // add other stuff
    NSArray <Tag*>*tags = self.selectedTags.allObjects;
    NSString *amount = self.amountTextField.text;
    NSString *note = self.noteTextField.text;
    NSDate *timeStamp = self.datePicked;
    NSDictionary *results = @{@"tags": tags, @"amount": amount, @"note": note, @"timeStamp": timeStamp};
//        NSDictionary *results = @{@"amount": amount, @"note": note, @"timeStamp": timeStamp};

    
    
    [self.dataHandler saveReceipt:results];
    [self.navigationController popViewControllerAnimated:YES];
    
}









@end
