//
//  GameMenuView.m
//  Invaders
//
//  Created by Yangfan Qi on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameMenuView.h"
#import "AppDelegate.h"

@interface GameMenuView ()

@end

@implementation GameMenuView

-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    goodToGo = false;
    gameStarted = FALSE;
    
    //init background
    background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MenuBackGround.png"]];
    background.frame = CGRectMake(0, 0, background.image.size.width, background.image.size.height);
    [self.view addSubview:background];
    //background.alpha = 0.3;
    [background release];
    
    

    
    gameTitle = [[UILabel alloc]init];
    gameTitle.frame = CGRectMake(0, 0, 230, 50);
    gameTitle.center = CGPointMake(768/2, 50);
    gameTitle.textColor = [UIColor whiteColor];
    gameTitle.backgroundColor = [UIColor clearColor];
    gameTitle.font = [UIFont boldSystemFontOfSize:50];
    gameTitle.text = @"Invaders";
    [self.view addSubview:gameTitle];
    [gameTitle release];
    
    
    newGameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    newGameButton.frame = CGRectMake(650, 10, 120, 60);
    newGameButton.center = CGPointMake(383, 120);
    [newGameButton setBackgroundImage:[UIImage imageNamed:@"NewGameButton"] forState:UIControlStateNormal];
    [newGameButton setBackgroundImage:[UIImage imageNamed:@"NewGameButton"] forState:UIControlStateSelected];
   // [newGameButton setTitle:@"New Game" forState:UIControlStateNormal];
    [self.view addSubview:newGameButton];
    [newGameButton addTarget:self action:@selector(NewGame) forControlEvents:UIControlEventTouchDown];
    
    resumeGameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resumeGameButton.frame = CGRectMake(650, 110, 120, 60);
    resumeGameButton.center = CGPointMake(383, 200);
    [resumeGameButton setBackgroundImage:[UIImage imageNamed:@"ResumeGameButton"] forState:UIControlStateNormal];
    [resumeGameButton setBackgroundImage:[UIImage imageNamed:@"ResumeGameButton"] forState:UIControlStateSelected];
   // [resumeGameButton setTitle:@"Resume Game" forState:UIControlStateNormal];
    [self.view addSubview:resumeGameButton];
    [resumeGameButton addTarget:self action:@selector(ResumeGame) forControlEvents:UIControlEventTouchDown];
    resumeGameButton.hidden = true;
    
    //setup help button
    helpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    helpButton.frame = CGRectMake(650, 300, 120, 60);
    helpButton.center = CGPointMake(383, 300);
    [helpButton setBackgroundImage:[UIImage imageNamed:@"HowToPlayButton"] forState:UIControlStateNormal];
    [helpButton setBackgroundImage:[UIImage imageNamed:@"HowToPlayButton"] forState:UIControlStateSelected];
   // helpButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    //[helpButton setTitle:@"How to play" forState:UIControlStateNormal];
    //helpButton.transform = CGAffineTransformMakeRotation(M_PI_2);
    [self.view addSubview:helpButton];
    [helpButton addTarget:self action:@selector(didPushHelpButton) forControlEvents:UIControlEventTouchDown];
    
    //setup credits button
    Creditsbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Creditsbutton.frame = CGRectMake(650, 300, 120, 60);
    Creditsbutton.center = CGPointMake(383, 380);
    [Creditsbutton setBackgroundImage:[UIImage imageNamed:@"CreditsButton"] forState:UIControlStateNormal];
    [Creditsbutton setBackgroundImage:[UIImage imageNamed:@"CreditsButton"] forState:UIControlStateSelected];
    //[Creditsbutton setTitle:@"Credits" forState:UIControlStateNormal];
    //helpButton.transform = CGAffineTransformMakeRotation(M_PI_2);
    [self.view addSubview:Creditsbutton];
    [Creditsbutton addTarget:self action:@selector(didPushCreditsButton) forControlEvents:UIControlEventTouchDown];

    
    Help = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Help.png"]];
    Help.frame = CGRectMake(0, 0, Help.image.size.width, Help.image.size.height);
    [self.view  addSubview:Help];
    Help.hidden = true;
    [Help release];
    
    Credits = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Credits.png"]];
    Credits.frame = CGRectMake(0, 0, Credits.image.size.width, Credits.image.size.height);
    Credits.center = CGPointMake(768/2, 1024/2);
    [self.view  addSubview:Credits];
    Credits.hidden = true;
    [Credits release];
    
    CFURLRef sayInvadersURL = (CFURLRef) [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Invaders" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID(sayInvadersURL, &SayInvaders);
    
    [self GameStartAnimation];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //  NSLog(@"touches began");
    UITouch *touch = [touches anyObject];
    
    CGPoint touchLocation = [touch locationInView:self.view];
    NSLog(@"touch at (%i,%i)",(int)touchLocation.x,(int)touchLocation.y);
    
    if(Help.hidden == false){
        Help.hidden = true;
        [self ShowAllButton];
    }
    if(Credits.hidden == false){
        Credits.hidden = true;
        [self ShowAllButton];
    }
}
-(void)NewGame{
    if(gameStarted){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Game" message:@"Are you sure you want to start a new game?" delegate:self cancelButtonTitle:@"Naaa" otherButtonTitles:@"Sure", nil];
        [alert show];
        [alert release];
    }
    else{
        AppDelegate* delegateroot = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        RootViewController *root = [delegateroot GetRootViewController];
        resumeGameButton.hidden = FALSE;
        gameStarted = TRUE;
        resumeGameButton.hidden = false;
        [root NewGame];
    }
}
- (void)ResumeGame{
    if(gameStarted){
        AppDelegate* delegateroot = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        RootViewController *root = [delegateroot GetRootViewController];
        [root ResumeGame];
    }
}
-(void)didPushHelpButton{
    Help.hidden = false;
    [self HideAllButton];
}
-(void)didPushCreditsButton{
    Credits.hidden = false;
    [self HideAllButton];
}
-(void)HideAllButton{
    helpButton.hidden = true;
    resumeGameButton.hidden = true;
    newGameButton.hidden = true;
    Creditsbutton.hidden = true;
}
-(void)ShowAllButton{
    helpButton.hidden = false;
    if(gameStarted)
        resumeGameButton.hidden = false;
    newGameButton.hidden = false;
    Creditsbutton.hidden = false;
}
-(void)GameStartAnimation{
    AudioServicesPlaySystemSound(SayInvaders);
    [self HideAllButton];
    background.frame = CGRectMake(0, 0, background.image.size.width*4, background.image.size.height*4);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(ShowAllButton)];
    background.frame = CGRectMake(0, 0, background.image.size.width, background.image.size.height);
    [UIView commitAnimations];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    
    if([title isEqualToString:@"Sure"])
    {
        AppDelegate* delegateroot = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        RootViewController *root = [delegateroot GetRootViewController];
        [root NewGame];
    }
    
}

@end
