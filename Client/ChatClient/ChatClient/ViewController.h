//
//  ViewController.h
//  ChatClient
//
//  Created by Stefan Lage on 7/15/13.
//  Copyright (c) 2013 Stefan Lage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSStreamDelegate, UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *messages;
}
@property (retain, nonatomic) IBOutlet UIView *joinView;
@property (retain, nonatomic) IBOutlet UITextField *inputNameField;
@property (retain, nonatomic) IBOutlet UIView *chatView;
@property (retain, nonatomic) IBOutlet UITextField *inputMessageField;
@property (retain, nonatomic) IBOutlet UITableView *tView;
@property (retain, nonatomic) IBOutlet UITextField *ipServer;

// Streaming instances
@property (retain, nonatomic) NSInputStream *inputStream;
@property (retain, nonatomic) NSOutputStream *outputSream;

- (IBAction)joinChat:(id)sender;
- (IBAction)sendMessage:(id)sender;

@end
