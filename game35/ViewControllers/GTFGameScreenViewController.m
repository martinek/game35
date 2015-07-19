//
//  GTFGameScreenViewController.m
//  game35
//
//  Created by Valter Martinek on 18.7.2015.
//  Copyright (c) 2015 freevision s.r.o. All rights reserved.
//

#import "GTFGameScreenViewController.h"

@interface GTFGameScreenViewController ()

@property NSArray *gameScreens;
@property NSDictionary *currentGameScreen;

@end

@implementation GTFGameScreenViewController

- (void)awakeFromNib {
  [self fixInsets];
  [self loadGameScreens];
  
  self.currentGameScreen = [self.gameScreens firstObject];
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

- (void)loadGameScreens {
  NSURL *dataFileURL = [[NSBundle mainBundle] URLForResource:@"data" withExtension:@"plist"];
  NSDictionary *gameData = [NSDictionary dictionaryWithContentsOfURL:dataFileURL];
  self.gameScreens = gameData[@"screens"];
}

@end
