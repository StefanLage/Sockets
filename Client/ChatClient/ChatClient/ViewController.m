//
//  ViewController.m
//  ChatClient
//
//  Created by Stefan Lage on 7/15/13.
//  Copyright (c) 2013 Stefan Lage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initNetworkCommunication];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_inputNameField release];
    [_joinView release];
    [_joinView release];
    [super dealloc];
}
- (IBAction)joinChat:(id)sender {
}

- (void)initNetworkCommunication {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 80, &readStream, &writeStream);
    self.inputStream = (NSInputStream *) readStream;
    self.outputSream = (NSOutputStream *) writeStream;
    // Opening the connection
    [_inputStream setDelegate: self];
    [_outputSream setDelegate: self];
    [_inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode: NSDefaultRunLoopMode];
    [_outputSream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode: NSDefaultRunLoopMode];
    [_inputStream open];
    [_outputSream open];
}

@end
