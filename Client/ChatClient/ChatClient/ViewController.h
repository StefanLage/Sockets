//
//  ViewController.h
//  ChatClient
//
//  Created by Stefan Lage on 7/15/13.
//  Copyright (c) 2013 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSStreamDelegate>
@property (retain, nonatomic) IBOutlet UIView *joinView;
@property (retain, nonatomic) IBOutlet UITextField *inputNameField;

// Streaming instances
@property (retain, nonatomic) NSInputStream *inputStream;
@property (retain, nonatomic) NSOutputStream *outputSream;

- (IBAction)joinChat:(id)sender;

@end
