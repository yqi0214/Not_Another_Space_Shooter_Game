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
    UIImageView *Bound;
    UIImageView *DropZone;
    
    UIImageView *Player2Invaders[100];
    Invader *Player2InvaderData[100];
   // UIImageView *Invaderss;
    UIImageView *Fighter;
    
    UIButton *Player1MoveArrow[2];
    UIButton *Player1FireButton;
    
    UIImageView *Player1bullets[100];
    //UIImageView *Player1bullet;
    NSMutableArray *Player1Bullets;
    
    bool player1MoveLeft;
    bool player1MoveRight;
    
    
    BOOL Player1BulletsAvailable[100];
    //BOOL Player2InvadersAvailable[100];
    
    
    
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
    
    NSTimer *timer;
}
-(void)NewGame;
-(void)InvaderMovement;
@end
