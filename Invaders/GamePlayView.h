//
//  GamePlayView.h
//  Space Invaders?
//
//  Created by Yangfan Qi on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamePlayView: UIViewController{
    UIImageView *Bound;
    UIImageView *DropZone;
    
    UIImageView *Invaders[100];
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
    BOOL Player2InvadersAvailable[100];
    
    
    int Player1Reinforcement;
    int Player2Reinforcement;
    
    UIImageView *Player1ReinforcementBar;
    UIImageView *Player2ReinforcementBar;
    
    UILabel *Player1ReinforcementLabel;
    UILabel *Player2ReinforcementLabel;
    
    
    int TotalBulletAvilable;
    int TotalInvadersAvailable;
    
    
    NSTimer *timer;
}
@end
