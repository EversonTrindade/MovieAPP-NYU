//
//  UpcomingDatailViewController.h
//  MovieAPP
//
//  Created by Everson Trindade on 18/04/14.
//  Copyright (c) 2014 Everson. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UpcomingDatailViewController : UIViewController{
    IBOutlet UIScrollView *scroller;
}
@property (strong, nonatomic) IBOutlet UITextField *movieName;
@property (strong, nonatomic) IBOutlet UITextField *movieDirector;
@property (strong, nonatomic) IBOutlet UITextField *movieGenre;
@property (strong, nonatomic) IBOutlet UITextField *movieDate;
@property (strong, nonatomic) IBOutlet UISegmentedControl *movieExpectation;
@property (strong) NSManagedObject *moviesDB;
- (IBAction)btnBack:(id)sender;
- (IBAction)btnSave:(id)sender;
- (BOOL)checkName;
- (IBAction) textFieldReturn:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *movieDatePi;


@end
