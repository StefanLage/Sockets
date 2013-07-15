//
//  ViewController.h
//  ChatClient
//
//  Created by Stefan Lage on 7/15/13.
//  Copyright (c) 2013 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *joinView;
@property (retain, nonatomic) IBOutlet UITextField *inputNameField;

- (IBAction)joinChat:(id)sender;

@end
