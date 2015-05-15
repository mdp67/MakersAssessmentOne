//
//  ViewController.m
//  MakersAssessmentOne
//
//  Created by Mark Porcella on 5/15/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondNumberTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonToSegue;
@property NSString *stringOfResult;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonToSegue.enabled = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    self.buttonToSegue.enabled = NO;
}

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    self.buttonToSegue.enabled = NO;
    [self.firstNumberTextField resignFirstResponder];
    [self.secondNumberTextField resignFirstResponder];
    int firstFloat = [self.firstNumberTextField.text intValue];
    int secondFloat = [self.secondNumberTextField.text intValue];
    int multiplicationResult = firstFloat * secondFloat;

    //int multiplicationResult = (int) multiplicationResult;
    if (multiplicationResult % 5 == 0) {
        self.buttonToSegue.enabled = YES;
    }
    self.stringOfResult = [NSString stringWithFormat:@"%i", multiplicationResult];
    self.title = self.stringOfResult;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ResultViewController *vc = segue.destinationViewController;
    vc.resultFromRootViewController = self.stringOfResult;
    
}

@end
