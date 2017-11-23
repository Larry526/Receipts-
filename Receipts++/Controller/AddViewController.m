//
//  AddViewController.m
//  Receipts++
//
//  Created by Larry Luk on 2017-11-23.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UIButton *personalCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *familyCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *businessCheckBox;
@property (assign, nonatomic) BOOL personalChecked;
@property (assign, nonatomic) BOOL familyChecked;
@property (assign, nonatomic) BOOL businessChecked;



@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.personalChecked = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)personalPressed:(UIButton *)sender {
    if(!self.personalChecked){
        [self.personalCheckBox setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        self.personalChecked = YES;
    }
    else if(self.personalChecked){
        [self.personalCheckBox setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        self.personalChecked = NO;
}
}


- (IBAction)familyPressed:(UIButton *)sender {
    if(!self.familyChecked){
        [self.familyCheckBox setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        self.familyChecked = YES;
    }
    else if(self.familyChecked){
        [self.familyCheckBox setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        self.familyChecked = NO;
    }
}

- (IBAction)businessPressed:(UIButton *)sender {
    if(!self.businessChecked){
        [self.businessCheckBox setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        self.businessChecked = YES;
    }
    else if(self.businessChecked){
        [self.businessCheckBox setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        self.businessChecked = NO;
    }
}








@end
