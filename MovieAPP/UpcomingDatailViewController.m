//
//  UpcomingDatailViewController.m
//  MovieAPP
//
//  Created by Everson Trindade on 18/04/14.
//  Copyright (c) 2014 Everson. All rights reserved.
//

#import "UpcomingDatailViewController.h"

@interface UpcomingDatailViewController ()

@end

@implementation UpcomingDatailViewController

@synthesize moviesDB;

NSDate *pickerDate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 548)];
    
    pickerDate = [self.movieDatePi date];
    
    if (self.moviesDB) {
        [self.movieName setText:[self.moviesDB valueForKey:@"movieName"]];
        [self.movieDirector setText:[self.moviesDB valueForKey:@"movieDirector"]];
        [self.movieGenre setText:[self.moviesDB valueForKey:@"movieGenre"]];
        [self.movieExpectation setSelectedSegmentIndex:[[self.moviesDB valueForKey:@"movieExpectation"] integerValue]];
        [self.movieDate setText:[self.moviesDB valueForKey:@"movieDate"]];
        //[self.movieDate setText:[self.moviesDB valueForKey:@"movieDate"]];
        //[self.movieDate setValue:self.movieDatePi forKey:@"movieDate"];
    }
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate respondsToSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSave:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.checkName == true) {
        
        if (self.moviesDB) {
            // Update existing movie
            [self.moviesDB setValue:self.movieName.text forKey:@"movieName"];
            [self.moviesDB setValue:self.movieDirector.text forKey:@"movieDirector"];
            [self.moviesDB setValue:self.movieGenre.text forKey:@"movieGenre"];
            [self.moviesDB setValue:[NSNumber numberWithInteger:self.movieExpectation.selectedSegmentIndex] forKey:@"movieExpectation"];
            [self.moviesDB setValue:self.movieDate.text forKey:@"movieDate"];
            //[self.moviesDB setValue:self.movieDatePi.date forKey:@"movieDate"];
        } else {
            // Create a new movie
            NSManagedObject *newMovie = [NSEntityDescription insertNewObjectForEntityForName:@"MoviesFuture" inManagedObjectContext:context];
            [newMovie setValue:self.movieName.text forKey:@"movieName"];
            [newMovie setValue:self.movieDirector.text forKey:@"movieDirector"];
            [newMovie setValue:self.movieGenre.text forKey:@"movieGenre"];
            [newMovie setValue:[NSNumber numberWithInteger:self.movieExpectation.selectedSegmentIndex] forKey:@"movieExpectation"];
            [newMovie setValue:self.movieDate.text forKey:@"movieDate"];
            //[newMovie setValue:self.movieDatePi.date forKey:@"movieDate"];

        }
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (BOOL)checkName{
    if ([self.movieName.text isEqual:@""]) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"ERROR!"
                                                         message:@"Movie Name Must Exist!"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles:nil];
        [alert addButtonWithTitle:@"OK!"];
        [alert show];
    }
    else{
        return true;
    }
    return false;
}


- (IBAction)textFieldReturn:(id)sender{
    [sender resignFirstResponder];
}

// POR PADRAO JA VEM SIM = 0
-(IBAction)segmentedControlChanged:(id)sender{
    switch (self.movieExpectation.selectedSegmentIndex) {
        case 0:
            NSLog(@"1");
            break;
        case 1:
            NSLog(@"2");
            break;
        case 2:
            NSLog(@"3");
            break;
        default:
            break;
    }
}

@end
