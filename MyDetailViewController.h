//
//  MyDetailViewController.h
//  MovieAPP
//
//  Created by Everson Trindade on 10/04/14.
//  Copyright (c) 2014 Everson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDetailViewController : UIViewController{
    IBOutlet UIScrollView *scroller;
}
@property (strong, nonatomic) IBOutlet UITextField *movieName;
@property (strong, nonatomic) IBOutlet UITextField *movieDirector;
@property (strong, nonatomic) IBOutlet UITextField *movieGenre;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnBack:(id)sender;
@property(strong) NSManagedObject *moviesDB;
@property (strong, nonatomic) IBOutlet UILabel *movieRating;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UITextView *movieOpinion;
@property (strong, nonatomic) IBOutlet UISegmentedControl *movieRecommendation;

- (IBAction) shareFacebook:(UIButton *)sender;
- (IBAction) shareTwitter:(UIButton *)sender;

- (IBAction) textFieldReturn:(id)sender;
- (BOOL) checkNameOpinion;
- (BOOL) checkName;

@end
