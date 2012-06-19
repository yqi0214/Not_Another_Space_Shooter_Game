//
//  GamePlayView.h
//  Space Invaders?
//
//  Created by Yangfan Qi on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Invader.h"

@interface GamePlayView: UIViewController{
    UIImageView *backGround;
    UIImageView *Bound;
    UIImageView *DropZone;
    
    
    int player2invaderselect;
    UIImageView *Player2InvaderSelection[4];
    UIImageView *Player2Invaders[100];
    Invader *Player2InvaderData[100];
   // UIImageView *Invaderss;
    UIImageView *Fighter;
    
    UIButton *Player1MoveArrow[2];
    UIButton *Player1FireButton;
    
    UIButton *backToMenu;
    
    UIImageView *Player1bullets[100];
    //UIImageView *Player1bullet;
    NSMutableArray *Player1Bullets;
    
    bool player1MoveLeft;
    bool player1MoveRight;
    
    
    BOOL Player1BulletsAvailable[100];
    //BOOL Player2InvadersAvailable[100];
    
    UIImage *FlyImage;
    UIImage *TankImage;
    UIImage *NinjaImage;
    UIImage *RamImage;
    
    UIImageView *Player1ReinforcementBar;
    UIImageView *Player2ReinforcementBar;
    UIImageView *Player1MaxReinforcementBar;
    UIImageView *Player2MaxReinforcementBar;
    
    
    UILabel *Player1ReinforcementLabel;
    UILabel *Player2ReinforcementLabel;
    
    
    int Player1Reinforcement;
    int Player2Reinforcement;
    
    int Player1MaxReinforcement;
    int Player2MaxReinforcement;
    
    int TotalBulletAvilable;
    int TotalInvadersAvailable;
    
    BOOL gameEnd;
    BOOL gamePause;
    
    NSTimer *gameTimer;
}
-(void)NewGame;
-(void)ResumeGame;
//-(void)InvaderMovement;
@end
