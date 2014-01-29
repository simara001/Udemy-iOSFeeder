//
//  MARViewController.m
//  Udemy-iOSFeeder
//
//  Created by Ramirez, Miguel on 1/28/14.
//  Copyright (c) 2014 Ramirez, Miguel. All rights reserved.
//

#import "MARViewController.h"

@interface MARViewController ()

@end

@implementation MARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark UITableView - Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"Hello World!";
    
    return cell;
}

@end
