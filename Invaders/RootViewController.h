//
//  RootViewController.h
//  Invaders
//
//  Created by Yangfan Qi on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePlayView.h"
#import "GameMenuView.h"

@interface RootViewController : UIViewController{
GamePlayView *gamePlayView;
GameMenuView *gameMenuView;

}
-(void)TwoPlayerGame;
-(void)SinglePlayer1;
-(void)SinglePlayer2;
-(void)BackToMenu;
-(void)ResumeGame;
@end
