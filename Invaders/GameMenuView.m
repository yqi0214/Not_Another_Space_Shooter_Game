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
    background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SpaceBackGround.png"]];
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
    newGameButton.frame = CGRectMake(650, 10, 100, 60);
    newGameButton.center = CGPointMake(383, 120);
    [newGameButton setTitle:@"New Game" forState:UIControlStateNormal];
    [self.view addSubview:newGameButton];
    [newGameButton addTarget:self action:@selector(NewGame) forControlEvents:UIControlEventTouchDown];
    
    resumeGameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resumeGameButton.frame = CGRectMake(650, 110, 120, 60);
    resumeGameButton.center = CGPointMake(383, 200);
    [resumeGameButton setTitle:@"Resume Game" forState:UIControlStateNormal];
    [self.view addSubview:resumeGameButton];
    [resumeGameButton addTarget:self action:@selector(ResumeGame) forControlEvents:UIControlEventTouchDown];
    resumeGameButton.hidden = true;

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
