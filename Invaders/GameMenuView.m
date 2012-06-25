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
    gameTitle.frame = CGRectMake(0, 0, 550, 50);
    gameTitle.center = CGPointMake(768/2, 50);
    gameTitle.textColor = [UIColor whiteColor];
    gameTitle.backgroundColor = [UIColor clearColor];
    gameTitle.font = [UIFont boldSystemFontOfSize:40];
    gameTitle.text = @"Not Another Space Shooter";
    [self.view addSubview:gameTitle];
    [gameTitle release];
    
    
    newGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    newGameButton.frame = CGRectMake(650, 10, 120, 60);
    newGameButton.center = CGPointMake(583, 120);
    [newGameButton setBackgroundImage:[UIImage imageNamed:@"NewGameButton"] forState:UIControlStateNormal];
    [newGameButton setBackgroundImage:[UIImage imageNamed:@"NewGameButton"] forState:UIControlStateSelected];
    // [newGameButton setTitle:@"New Game" forState:UIControlStateNormal];
    [self.view addSubview:newGameButton];
    [newGameButton addTarget:self action:@selector(NewGame) forControlEvents:UIControlEventTouchDown];
    
    resumeGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    resumeGameButton.frame = CGRectMake(650, 110, 120, 60);
    resumeGameButton.center = CGPointMake(583, 200);
    [resumeGameButton setBackgroundImage:[UIImage imageNamed:@"ResumeGameButton"] forState:UIControlStateNormal];
    [resumeGameButton setBackgroundImage:[UIImage imageNamed:@"ResumeGameButton"] forState:UIControlStateSelected];
    [self.view addSubview:resumeGameButton];
    [resumeGameButton addTarget:self action:@selector(ResumeGame) forControlEvents:UIControlEventTouchDown];
    resumeGameButton.hidden = true;
    
    //setup help button
    helpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    helpButton.frame = CGRectMake(650, 300, 120, 60);
    helpButton.center = CGPointMake(583, 300);
    [helpButton setBackgroundImage:[UIImage imageNamed:@"HowToPlayButton"] forState:UIControlStateNormal];
    [helpButton setBackgroundImage:[UIImage imageNamed:@"HowToPlayButton"] forState:UIControlStateSelected];
    [self.view addSubview:helpButton];
    [helpButton addTarget:self action:@selector(didPushHelpButton) forControlEvents:UIControlEventTouchDown];
    
    //setup credits button
    Creditsbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Creditsbutton.frame = CGRectMake(650, 300, 120, 60);
    Creditsbutton.center = CGPointMake(583, 380);
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
    
    
    //setup message board
    message = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MessageBoard"]];
    message.center = CGPointMake(768/2, 1024/2);
    [self.view addSubview:message];
    [message release];
    
    
    messageLabel = [[UILabel alloc]init];
    messageLabel.frame = CGRectMake(0, 0, 430, 50);
    messageLabel.center = CGPointMake(768/2, 400);
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.font = [UIFont boldSystemFontOfSize:20];
    messageLabel.text = @"Are you sure you want to start a new game?";
    [self.view addSubview:messageLabel];
    [messageLabel release];
    
    
    messageButton[0] = [UIButton buttonWithType:UIButtonTypeCustom];
    messageButton[0].frame = CGRectMake(650, 10, 120, 60);
    messageButton[0].center = CGPointMake(250, 630);
    [messageButton[0] setBackgroundImage:[UIImage imageNamed:@"Naaa"] forState:UIControlStateNormal];
    [messageButton[0] setBackgroundImage:[UIImage imageNamed:@"Naaa"] forState:UIControlStateSelected];
    [self.view addSubview:messageButton[0]];
    [messageButton[0] addTarget:self action:@selector(Naaa) forControlEvents:UIControlEventTouchDown];
    
    messageButton[1] = [UIButton buttonWithType:UIButtonTypeCustom];
    messageButton[1].frame = CGRectMake(650, 10, 120, 60);
    messageButton[1].center = CGPointMake(510, 630);
    [messageButton[1] setBackgroundImage:[UIImage imageNamed:@"TwoPlayerButton"] forState:UIControlStateNormal];
    [messageButton[1] setBackgroundImage:[UIImage imageNamed:@"TwoPlayerButton"] forState:UIControlStateSelected];
    [self.view addSubview:messageButton[1]];
    [messageButton[1] addTarget:self action:@selector(StartTwoPlayerGame) forControlEvents:UIControlEventTouchDown];
    
    messageButton[2] = [UIButton buttonWithType:UIButtonTypeCustom];
    messageButton[2].frame = CGRectMake(650, 10, 120, 60);
    messageButton[2].center = CGPointMake(510, 565);
    [messageButton[2] setBackgroundImage:[UIImage imageNamed:@"SinglePlayer1Button"] forState:UIControlStateNormal];
    [messageButton[2] setBackgroundImage:[UIImage imageNamed:@"SinglePlayer1Button"] forState:UIControlStateSelected];
    [self.view addSubview:messageButton[2]];
    [messageButton[2] addTarget:self action:@selector(StartSinglePlayer1) forControlEvents:UIControlEventTouchDown];
    
    messageButton[3] = [UIButton buttonWithType:UIButtonTypeCustom];
    messageButton[3].frame = CGRectMake(650, 10, 120, 60);
    messageButton[3].center = CGPointMake(510, 500);
    [messageButton[3] setBackgroundImage:[UIImage imageNamed:@"SinglePlayer2Button"] forState:UIControlStateNormal];
    [messageButton[3] setBackgroundImage:[UIImage imageNamed:@"SinglePlayer2Button"] forState:UIControlStateSelected];
    [self.view addSubview:messageButton[3]];
    [messageButton[3] addTarget:self action:@selector(StartSinglePlayer2) forControlEvents:UIControlEventTouchDown];
    
    
    message.hidden = true;
    messageLabel.hidden = true;
    messageButton[0].hidden = true;
    messageButton[1].hidden = true;
    messageButton[2].hidden = true;
    messageButton[3].hidden = true;
    
    
    
    // newGameButton.alpha =0.5;
    // resumeGameButton.alpha =0.5;
    // Creditsbutton.alpha =0.5;
    //helpButton.alpha =0.5;
    Credits.alpha = 0.5;
    
    CFURLRef sayInvadersURL = (CFURLRef) [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"NotAnotherSpaceShooterVoice" ofType:@"wav"]];
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
    // if(gameStarted){
    /*
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Game" message:@"Are you sure you want to start a new game?" delegate:self cancelButtonTitle:@"Naaa" otherButtonTitles:@"Sure", nil];
     [alert show];
     [alert release];*/
    
    message.hidden = false;
    messageLabel.hidden = false;
    messageButton[0].hidden = false;
    messageButton[1].hidden = false;
    messageButton[2].hidden = false;
    messageButton[3].hidden = false;
    
    /* 
     }
     else{
     AppDelegate* delegateroot = (AppDelegate*)[[UIApplication sharedApplication] delegate];
     RootViewController *root = [delegateroot GetRootViewController];
     resumeGameButton.hidden = FALSE;
     gameStarted = TRUE;
     resumeGameButton.hidden = false;
     [root NewGame];
     }
     */
}
-(void)ResumeGame{
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
    if(arc4random()%2==0)
        background.frame = CGRectMake(768-background.image.size.width*4, 1024-background.image.size.height*4,
                                      background.image.size.width*4, background.image.size.height*4);
    else
        background.frame = CGRectMake(0, 0,background.image.size.width*4, background.image.size.height*4);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(ShowAllButton)];
    background.frame = CGRectMake(0, 0, background.image.size.width, background.image.size.height);
    [UIView commitAnimations];
}
-(void)StartTwoPlayerGame{
    message.hidden = true;
    messageLabel.hidden = true;
    messageButton[0].hidden = true;
    messageButton[1].hidden = true;
    messageButton[2].hidden = true;
    messageButton[3].hidden = true;
    gameStarted = TRUE;
    AppDelegate* delegateroot = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    RootViewController *root = [delegateroot GetRootViewController];
    [root TwoPlayerGame];
}
-(void)StartSinglePlayer1{
    message.hidden = true;
    messageLabel.hidden = true;
    messageButton[0].hidden = true;
    messageButton[1].hidden = true;
    messageButton[2].hidden = true;
    messageButton[3].hidden = true;
    gameStarted = TRUE;
    AppDelegate* delegateroot = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    RootViewController *root = [delegateroot GetRootViewController];
    [root SinglePlayer1];
}
-(void)StartSinglePlayer2{
    message.hidden = true;
    messageLabel.hidden = true;
    messageButton[0].hidden = true;
    messageButton[1].hidden = true;
    messageButton[2].hidden = true;
    messageButton[3].hidden = true;
    gameStarted = TRUE;
    AppDelegate* delegateroot = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    RootViewController *root = [delegateroot GetRootViewController];
    [root SinglePlayer2];
}
-(void)Naaa{
    message.hidden = true;
    messageLabel.hidden = true;
    messageButton[0].hidden = true;
    messageButton[1].hidden = true;
    messageButton[2].hidden = true;
    messageButton[3].hidden = true;
}



@end
