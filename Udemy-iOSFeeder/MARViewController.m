//
//  MARViewController.m
//  Udemy-iOSFeeder
//
//  Created by Ramirez, Miguel on 1/28/14.
//  Copyright (c) 2014 Ramirez, Miguel. All rights reserved.
//

#import "MARViewController.h"

@interface MARViewController () {
    __strong NSMutableData *responseData;
    __strong NSURLConnection *connection;
}

@end

@implementation MARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.mainArray = [@[@"Noticia #1", @"Noticia #2", @"Noticia #3"]mutableCopy];
    self.mainArray = [NSMutableArray new];
    responseData = [NSMutableData data];
    NSString *urlString = @"http://api.espn.com/v1/sports/basketball/nba/news/headlines/top/?apikey=kdep287cnj4xg5rsn2sm74y6";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

#pragma mark - UITableView - Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.mainArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.mainArray[indexPath.row][@"headline"];
    
    return cell;
}

#pragma mark - NSURLConnection Methods

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    self.mainArray = json[@"headlines"];
    [self.mainFeeder reloadData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Hubo un error con la conexión a ESPN");
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
    
}

@end
