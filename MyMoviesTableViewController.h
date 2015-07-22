//
//  MyMoviesTableViewController.h
//  MovieAPP
//
//  Created by Everson Trindade on 10/04/14.
//  Copyright (c) 2014 Everson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyMoviesTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong) NSMutableArray *moviesArray;
@end
