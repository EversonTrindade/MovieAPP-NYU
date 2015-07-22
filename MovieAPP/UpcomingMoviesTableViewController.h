//
//  UpcomingMoviesTableViewController.h
//  MovieAPP
//
//  Created by Everson Trindade on 18/04/14.
//  Copyright (c) 2014 Everson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpcomingMoviesTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong) NSMutableArray *moviesArray;


@end
