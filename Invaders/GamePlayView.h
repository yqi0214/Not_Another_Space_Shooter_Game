//
//  GamePlayView.h
//  Space Invaders?
//
//  Created by Yangfan Qi on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>
#import "Invader.h"

@interface GamePlayView: UIViewController{
    
    //player2 side objects and values
    int player2invaderselect;
    UIImageView *Player2InvaderSelection[4];
    UIImageView *Player2Invaders[100];
    Invader *Player2InvaderData[100];
    
    UIImage *FlyImage;
    UIImage *TankImage;
    UIImage *NinjaImage;
    UIImage *RamImage;
   
    
    //player1 side objects and values
    UIImageView *Fighter;
    
    UIImageView *Player1bullets[100];
    BOOL Player1BulletsAvailable[100];
    
    bool player1MoveLeft;
    bool player1MoveRight;
    UIButton *Player1MoveArrow[2];
    UIButton *Player1FireButton;
    UIButton *Player1AltFireButton;
    UIImageView *Player1Pad;
    CGPoint Player1PadOriginPoint;
    
    
    //reinforcement bars
    UIImageView *Player1ReinforcementBar;
    UIImageView *Player2ReinforcementBar;
    UIImageView *Player1MaxReinforcementBar;
    UIImageView *Player2MaxReinforcementBar;
    
    //UILabel *Player1ReinforcementLabel;
   // UILabel *Player2ReinforcementLabel;
    
    int Player1Reinforcement;
    int Player2Reinforcement;
    int Player1MaxReinforcement;
    int Player2MaxReinforcement;
    
    UIImageView *StateBound;
    
    //energy bars
    UIImageView *Player1EnergyBar;
    UIImageView *Player2EnergyBar;
    UIImageView *Player1MaxEnergyBar;
    UIImageView *Player2MaxEnergyBar;
    
    float player1Energy;
    int player1MaxEnergy;
    float player2Energy;
    int player2MaxEnergy;
    
    //sounds effects
    /*
    AVAudioPlayer *ShootingBullet;
    AVAudioPlayer *InvaderDestroy;
    AVAudioPlayer *HitInvader;
    */
    SystemSoundID ShootingBullet;
    SystemSoundID InvaderDestroy;
    SystemSoundID HitInvader;
    SystemSoundID InvaderCrossThrough;
    SystemSoundID HitFighter;
    
    //end game board
    UIImageView *GameEndBoard;
    UIImageView *GameEndImage;
    //UILabel *GameEndBoardLabel;
    UIButton *GameEndBoardButton;
  
    //other game objects and values
    BOOL player1AI;
    BOOL player2AI;
    
    int TotalBulletAvilable;
    int TotalInvadersAvailable;
    
    BOOL gameEnd;
    BOOL gamePause;
    
    UIImageView *backGround;
    UIImageView *Bound;
    UIImageView *DropZone;
    
    UIButton *backToMenu;
    UIButton *toggleControl;
    
    UILabel *gametime;
    
    NSTimer *gameTimer;
    float currentTime;
    float previousTime;
}
-(void)NewGame;
-(void)SinglePlayer1;
-(void)SinglePlayer2;
-(void)TwoPlayerGame;
-(void)ResumeGame;
//-(void)InvaderMovement;
@end
