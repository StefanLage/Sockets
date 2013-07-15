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
    [_inputMessageField release];
    [_tView release];
    [_chatView release];
    [super dealloc];
}

- (IBAction)joinChat:(id)sender {
    NSString *response = [NSString stringWithFormat:@"iam:%@", _inputNameField.text];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [_outputSream write:[data bytes] maxLength:[data length]];
    // Swith to ChatView
    //[self.view bringSubviewToFront:_chatView];
    [self.view addSubview:_chatView];
    [_chatView release];
}

- (IBAction)sendMessage:(id)sender {
    NSString *response = [NSString stringWithFormat:@"msg:%@", _inputMessageField.text];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [_outputSream write:[data bytes] maxLength:[data length]];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ChatCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == Nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

@end
