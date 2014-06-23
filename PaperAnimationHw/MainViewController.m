//
//  MainViewController.m
//  PaperAnimationHw
//
//  Created by Tony DeAngelo on 6/23/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()
- (IBAction)onActionPan:(UIPanGestureRecognizer *)sender;



@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureRecognizer;
@property (weak, nonatomic) IBOutlet UIView *onViewMove;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *onScrollView;



@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
   
    
    self.scrollView.contentSize = CGSizeMake(2889,254);


 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}

- (IBAction)onActionPan:(UIPanGestureRecognizer *)actionRecognize {
    NSLog(@"Pan Occurred");
    
    CGPoint point = [actionRecognize locationInView:self.view];
    CGPoint velocity = [actionRecognize velocityInView:self.view];
    
    if (actionRecognize.state == UIGestureRecognizerStateBegan) {
    NSLog(@"Gesture began at: %@", NSStringFromCGPoint(point));
    
    }
    
    else if (actionRecognize.state == UIGestureRecognizerStateChanged)
    
    { CGPoint translation = [actionRecognize translationInView:actionRecognize.view];
        
        if (actionRecognize.view.frame.origin.y + translation.y > -20)
            
        {
        actionRecognize.view.center = CGPointMake(actionRecognize.view.center.x, actionRecognize.view.center.y+ translation.y);
        }
        
        [actionRecognize setTranslation:CGPointMake(0, 0) inView:actionRecognize.view];
        
        NSLog(@"Gesture changed: %@", NSStringFromCGPoint(point));
        
    } else if (actionRecognize.state == UIGestureRecognizerStateEnded)
    
    {
        
        [UIView animateWithDuration:1.0 animations:^{
            
            if (velocity.y > 0)
                
            {
                CGRect frame = actionRecognize.view.frame;
                frame.origin.y = 500;
                actionRecognize.view.frame = frame;
            }
            else {
                CGRect frame = actionRecognize.view.frame;
                frame.origin.y = 0;
                actionRecognize.view.frame = frame;
            }
    
        }];
        NSLog(@"Gesture ended: %@", NSStringFromCGPoint(point));
    }
}
    
@end
