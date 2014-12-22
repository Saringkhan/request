//
//  ViewController.m
//  request
//
//  Created by Saringkhan on 12/21/2557 BE.
//  Copyright (c) 2557 Saringkhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sync:(id)sender {
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://202.44.47.48/info_graphic/test.php"]];
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (theConnection) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sync"
                                                        message:@"Synchronous Request URL"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

        NSData *theData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSDictionary *newJSON = [NSJSONSerialization JSONObjectWithData:theData options:0 error:nil];
        NSLog(@"JSON: %@", newJSON);
    }
}

@end
