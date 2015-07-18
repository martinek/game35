//
//  GTFGameScreenViewController.m
//  game35
//
//  Created by Valter Martinek on 18.7.2015.
//  Copyright (c) 2015 freevision s.r.o. All rights reserved.
//

#import "GTFGameScreenViewController.h"

@interface GTFGameScreenViewController ()

@property NSDictionary *currentGameScreen;

@end

@implementation GTFGameScreenViewController

- (void)awakeFromNib {
  [self fixInsets];
  
  self.currentGameScreen = @{
                             @"id": @(1),
                             @"texts": @[
                                 @"It is 9:00AM EST. The date is October 14th, 2022.",
                                 @"Your wife has already....",
                                 @"She will not...",
                                 @"You have just woken up..."
                                 ],
                              @"next": @(2)
                             };
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.currentGameScreen[@"texts"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
  cell.textLabel.text = [self textForIndexPath:indexPath];
  return cell;
}

- (NSString*)textForIndexPath:(NSIndexPath*)indexPath {
  return self.currentGameScreen[@"texts"][(NSInteger)indexPath.row];
}

- (void)fixInsets {
  CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
  self.tableView.contentInset = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
}

@end
