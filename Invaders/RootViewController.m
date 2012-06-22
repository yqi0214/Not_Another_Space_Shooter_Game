//
//  RootViewController.m
//  Invaders
//
//  Created by Yangfan Qi on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

-(void)viewDidLoad{
    
    gamePlayView = [GamePlayView new];
    gameMenuView = [GameMenuView new];
    
    
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    gameMenuView.view.frame = frame;
    gamePlayView.view.frame = frame;
    
    [self.view addSubview:gameMenuView.view];
    [self.view addSubview:gamePlayView.view];
    gamePlayView.view.hidden = true;
    
}

-(void)BackToMenu {
    gamePlayView.view.hidden = TRUE;
    [gameMenuView GameStartAnimation];
    
}
-(void)ResumeGame{
    gamePlayView.view.hidden = FALSE;
    [gamePlayView ResumeGame];
}
-(void)NewGame{
    [gamePlayView NewGame];
    gamePlayView.view.hidden = FALSE;
}


@end
