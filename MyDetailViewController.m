//
//  MyDetailViewController.m
//  MovieAPP
//
//  Created by Everson Trindade on 10/04/14.
//  Copyright (c) 2014 Everson. All rights reserved.
//

#import "MyDetailViewController.h"
#import <Social/Social.h>

@interface MyDetailViewController ()
@end

@implementation MyDetailViewController

@synthesize moviesDB, movieRecommendation;
@synthesize movieRating, movieOpinion;
//@synthesize movieOpinion;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 548)];
    
    if (self.moviesDB) {
        [self.movieName setText:[self.moviesDB valueForKey:@"movieName"]];
        [self.movieDirector setText:[self.moviesDB valueForKey:@"movieDirector"]];
        [self.movieGenre setText:[self.moviesDB valueForKey:@"movieGenre"]];
        [self.movieOpinion setText:[self.moviesDB valueForKey:@"movieOpinion"]];
        [self.movieRecommendation setSelectedSegmentIndex:[[self.moviesDB valueForKey:@"movieRecommendation"] integerValue]];
        [self.movieRating setText:[self.moviesDB valueForKeyPath:@"movieRating"]];
        
    }
    //slider = movieRating;
    NSString *textValue = [movieRating text];
    float value = [textValue floatValue];
    self.slider.value = value;
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

- (IBAction)btnSave:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.checkName == true) {
        
        if (self.moviesDB) {
            // Update existing movie
            [self.moviesDB setValue:self.movieName.text forKey:@"movieName"];
            [self.moviesDB setValue:self.movieDirector.text forKey:@"movieDirector"];
            [self.moviesDB setValue:self.movieGenre.text forKey:@"movieGenre"];
            [self.moviesDB setValue:self.movieOpinion.text forKey:@"movieOpinion"];
            [self.moviesDB setValue:[NSNumber numberWithInteger:self.movieRecommendation.selectedSegmentIndex] forKey:@"movieRecommendation"];
            [self.moviesDB setValue:self.movieRating.text forKey:@"movieRating"];
        } else {
            // Create a new movie
            NSManagedObject *newMovie = [NSEntityDescription insertNewObjectForEntityForName:@"MoviesPast" inManagedObjectContext:context];
            [newMovie setValue:self.movieName.text forKey:@"movieName"];
            [newMovie setValue:self.movieDirector.text forKey:@"movieDirector"];
            [newMovie setValue:self.movieGenre.text forKey:@"movieGenre"];
            [newMovie setValue:self.movieOpinion.text forKey:@"movieOpinion"];
            [newMovie setValue:[NSNumber numberWithInteger:self.movieRecommendation.selectedSegmentIndex] forKey:@"movieRecommendation"];
            [newMovie setValue:self.movieRating.text forKey:@"movieRating"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)btnBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)sliderValueChanged:(id)sender{
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
    movieRating.text = newText;
}

// POR PADRAO JA VEM SIM = 0
-(IBAction)segmentedControlChanged:(id)sender{
    switch (self.movieRecommendation.selectedSegmentIndex) {
        case 0:
            NSLog(@"1");
            break;
        case 1:
            NSLog(@"2");
            break;
        default:
            break;
    }
}

- (IBAction)shareFacebook:(UIButton *)sender {
    if (self.checkNameOpinion == true) {
        SLComposeViewController *sendText = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [sendText setTitle:@"MovieAPP"];
        [sendText setInitialText:self.movieOpinion.text];
        //[sendText setInitialText:@"'%@'", _movieOpinion.text];
        [self presentViewController:sendText animated:YES completion:nil];
    }
}



- (IBAction)shareTwitter:(UIButton *)sender {
    if (self.checkNameOpinion == true) {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setTitle:@"MovieAPP"];
        [tweetSheet setInitialText:self.movieOpinion.text];
        [tweetSheet addImage:[UIImage imageNamed:@"twitter.png"]];
        [tweetSheet addURL:[NSURL URLWithString:@"http://google.com/"]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
}

- (IBAction)textFieldReturn:(id)sender{
    [sender resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([movieOpinion isFirstResponder] && [touch view] != movieOpinion) {
        [movieOpinion resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)checkNameOpinion{
    if ([self.movieName.text isEqual:@""] || [self.movieOpinion.text isEqual:@""]) {
        
        if ([self.movieName.text isEqual:@""] && [self.movieOpinion.text isEqual:@""]) {
            UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"ERROR!"
                                                             message:@"Name and Opinion Must Exist!"
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:nil];
            [alert addButtonWithTitle:@"OK!"];
            [alert show];
        }
        else if ([self.movieName.text isEqual:@""]) {
            UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"ERROR!"
                                                             message:@"Movie Name Must Exist!"
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:nil];
            [alert addButtonWithTitle:@"OK!"];
            [alert show];
            
        }else if ([self.movieOpinion.text isEqual:@""]){
            UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"ERROR!"
                                                             message:@"Movie Opinion Must Exist!"
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:nil];
            [alert addButtonWithTitle:@"OK!"];
            [alert show];
        }
    }else{
        return true;
    }
    return false;
}

- (BOOL) checkName{
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



- (NSUInteger) supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
    //http://www.youtube.com/watch?v=sL0ukBzoLvo
}
@end
