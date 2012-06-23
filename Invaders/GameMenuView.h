//
//  GameMenuView.h
//  Invaders
//
//  Created by Yangfan Qi on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h> 

@interface GameMenuView : UIViewController{
    BOOL goodToGo;
    BOOL gameStarted;
    
    UIImageView *background;
   
    UIImageView *Help;
    UIImageView *Credits;
    
    UILabel *gameTitle;
  
    
    UIButton *newGameButton;
    UIButton *resumeGameButton;
    
    
    UIButton *helpButton;
    UIButton *Creditsbutton;
    
    SystemSoundID SayInvaders;
}
-(void)GameStartAnimation;
@end
