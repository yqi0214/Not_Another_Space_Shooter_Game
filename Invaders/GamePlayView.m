//
//  GamePlayView.m
//  Space Invaders?
//
//  Created by Yangfan Qi on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GamePlayView.h"
#import "AppDelegate.h"
@interface GamePlayView ()

@end

@implementation GamePlayView

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.multipleTouchEnabled = YES;
   // self.view.backgroundColor = [UIColor blackColor];
    
    FlyImage = [[UIImage imageNamed:@"Fly.png"]retain];
    TankImage = [[UIImage imageNamed:@"Tank.png"]retain];
    NinjaImage = [[UIImage imageNamed:@"Ninja.png"]retain];
    RamImage = [[UIImage imageNamed:@"Invader.png"]retain];
    
    backGround = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SpaceBackGround.png"]];
    backGround.frame = CGRectMake(0, -1024, backGround.image.size.width, backGround.image.size.height);
    [self.view  addSubview:backGround];
    [backGround release];
    
    DropZone = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DropZone.png"]];
    DropZone.frame = CGRectMake(60, 65, DropZone.image.size.width, DropZone.image.size.height);
    [self.view  addSubview:DropZone];
    [DropZone release];
    DropZone.alpha =0.3;
   
    
    Fighter = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Fighter.png"]];
    Fighter.frame = CGRectMake(200, 300, Fighter.image.size.width, Fighter.image.size.height);
    [self.view  addSubview:Fighter];
   // Fighter.center = CGPointMake(768/2, 920);
    [Fighter release];
    

    //bullets ready setup Invaders
    for(int i=0; i <100; i++){
        //Player1BulletsAvailable[i] = TRUE;
       // Player2InvadersAvailable[i] = TRUE;
        Player1bullets[i] = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Bullet.png"]];
        [self.view addSubview:Player1bullets[i]];
      //  Player1bullets[i].center =CGPointMake(100, -200);
        [Player1bullets[i] release];
        
        
        Player2Invaders[i] = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Invader.png"]];
        [self.view addSubview:Player2Invaders[i]];
       // Invaders[i].center =CGPointMake(-200, -200);
        [Player2Invaders[i] release];
        
        Player2InvaderData[i] = [[Invader alloc]initWithType:Fly];
    }
   
    
    Bound = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bound.png"]];
    Bound.frame = CGRectMake(0, 0, Bound.image.size.width, Bound.image.size.height);
    [self.view  addSubview:Bound];
    [Bound release];
    
    //setup buttons
    Player1FireButton = [UIButton buttonWithType:UIButtonTypeCustom];
    Player1FireButton.frame = CGRectMake(650, 960, 60, 60);
    // Player1FireButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    //[FireButton setTitle:@"Fire" forState:UIControlStateNormal];
    [Player1FireButton setBackgroundImage:[UIImage imageNamed:@"FireButton"] forState:UIControlStateNormal];
    [Player1FireButton setBackgroundImage:[UIImage imageNamed:@"FireButton"] forState:UIControlStateSelected];
    // Player1FireButton
    [self.view addSubview:Player1FireButton];
    [Player1FireButton addTarget:self action:@selector(Player1Fire) forControlEvents:UIControlEventTouchDown];
    
    Player1AltFireButton = [UIButton buttonWithType:UIButtonTypeCustom];
    Player1AltFireButton.frame = CGRectMake(550, 960, 60, 60);
    // Player1FireButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    //[FireButton setTitle:@"Fire" forState:UIControlStateNormal];
    [Player1AltFireButton setBackgroundImage:[UIImage imageNamed:@"AltFireButton"] forState:UIControlStateNormal];
    [Player1AltFireButton setBackgroundImage:[UIImage imageNamed:@"AltFireButton"] forState:UIControlStateSelected];
    // Player1FireButton
    [self.view addSubview:Player1AltFireButton];
    [Player1AltFireButton addTarget:self action:@selector(Player1AltFire) forControlEvents:UIControlEventTouchDown];
    
    
    Player1MoveArrow[0] = [UIButton buttonWithType:UIButtonTypeCustom];
    Player1MoveArrow[0].frame = CGRectMake(50, 960, 70, 60);
    [Player1MoveArrow[0] setBackgroundImage:[UIImage imageNamed:@"Arrow.png"] forState:UIControlStateNormal];
    [Player1MoveArrow[0] setBackgroundImage:[UIImage imageNamed:@"Arrow.png"] forState:UIControlStateSelected];
    Player1MoveArrow[0].transform = CGAffineTransformMakeRotation(M_PI);
    [self.view addSubview:Player1MoveArrow[0]];
    [Player1MoveArrow[0] addTarget:self action:@selector(Player1MoveLeft) forControlEvents:UIControlEventTouchDown];
    [Player1MoveArrow[0] addTarget:self action:@selector(Player1MoveStop) forControlEvents:UIControlEventTouchUpInside];
    [Player1MoveArrow[0] addTarget:self action:@selector(Player1MoveStop) forControlEvents:UIControlEventTouchUpOutside];
    
    
    Player1MoveArrow[1] = [UIButton buttonWithType:UIButtonTypeCustom];
    Player1MoveArrow[1].frame = CGRectMake(130, 960, 70, 60);
    [Player1MoveArrow[1] setBackgroundImage:[UIImage imageNamed:@"Arrow.png"] forState:UIControlStateNormal];
    [Player1MoveArrow[1] setBackgroundImage:[UIImage imageNamed:@"Arrow.png"] forState:UIControlStateSelected];
    [self.view addSubview:Player1MoveArrow[1]];
    [Player1MoveArrow[1] addTarget:self action:@selector(Player1MoveRight) forControlEvents:UIControlEventTouchDown];
    [Player1MoveArrow[1] addTarget:self action:@selector(Player1MoveStop) forControlEvents:UIControlEventTouchUpInside];
    [Player1MoveArrow[1] addTarget:self action:@selector(Player1MoveStop) forControlEvents:UIControlEventTouchUpOutside];
    
    
    //setup player1 control pad
   // Player1MoveArrow[0].hidden = true;
  //  Player1MoveArrow[1].hidden = true;
    
    Player1Pad= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RedBall.png"]];
    Player1Pad.frame =CGRectMake(100, 960,60, 60);
    [self.view addSubview:Player1Pad];
    Player1PadOriginPoint = Player1Pad.center;
    [Player1Pad release];
    Player1Pad.hidden = true;
    
    //setup back to menu button
    backToMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [backToMenu setBackgroundImage:[UIImage imageNamed:@"BackToMenuButton"] forState:UIControlStateNormal];
    [backToMenu setBackgroundImage:[UIImage imageNamed:@"BackToMenuButton"] forState:UIControlStateSelected];
    backToMenu.frame = CGRectMake(-20, 1024/2, 90, 40);
   // backToMenu.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    //[backToMenu setTitle:@"Back To Menu" forState:UIControlStateNormal];
    backToMenu.transform = CGAffineTransformMakeRotation(-M_PI_2);
    [self.view addSubview:backToMenu];
    [backToMenu addTarget:self action:@selector(BackToMenu) forControlEvents:UIControlEventTouchDown];

   
    
    //setup invader selection
    for(int i =0 ;i < 4;i++){
        Player2InvaderSelection[i] = [[UIImageView alloc] init];
        Player2InvaderSelection[i].transform = CGAffineTransformMakeRotation(M_PI);
        Player2InvaderSelection[i].frame = CGRectMake(10 +60*i,5,50, 50);
        [self.view  addSubview:Player2InvaderSelection[i]];
        [Player2InvaderSelection[i] release];
        Player2InvaderSelection[i].transform = CGAffineTransformMakeRotation(M_PI);
    }
    player2invaderselect = Fly;
    Player2InvaderSelection[0].image = FlyImage;
    Player2InvaderSelection[1].image = RamImage;
    Player2InvaderSelection[2].image = TankImage;
    Player2InvaderSelection[3].image = NinjaImage;
    
   
    //setup reinforcement bars
    Player1ReinforcementBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlueBar.png"]];
    Player1ReinforcementBar.frame =CGRectMake(760-15+2, 1024/2,
                                              Player1ReinforcementBar.image.size.width, Player1ReinforcementBar.image.size.height);
    [self.view  addSubview:Player1ReinforcementBar];
    [Player1ReinforcementBar release];
    Player1ReinforcementBar.alpha =0.5;
    
    Player2ReinforcementBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RedBar.png"]];
    Player2ReinforcementBar.frame = CGRectMake(760-15+2, 1024/2-Player2ReinforcementBar.image.size.height,
                                               Player2ReinforcementBar.image.size.width, Player2ReinforcementBar.image.size.height);
    
    [self.view  addSubview:Player2ReinforcementBar];
    [Player2ReinforcementBar release];
    Player2ReinforcementBar.alpha =0.5;
    
    Player1MaxReinforcementBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlueBar.png"]];
    Player1MaxReinforcementBar.frame =CGRectMake(760-15+2, 1024/2,
                                              Player1MaxReinforcementBar.image.size.width, Player1MaxReinforcementBar.image.size.height);
    [self.view  addSubview:Player1MaxReinforcementBar];
    [Player1MaxReinforcementBar release];
    Player1MaxReinforcementBar.alpha =0.2;
    
    Player2MaxReinforcementBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RedBar.png"]];
    Player2MaxReinforcementBar.frame = CGRectMake(760-15+2, 1024/2-Player2MaxReinforcementBar.image.size.height,
                                               Player2MaxReinforcementBar.image.size.width, Player2MaxReinforcementBar.image.size.height);
    
    [self.view  addSubview:Player2MaxReinforcementBar];
    [Player2MaxReinforcementBar release];
    Player2MaxReinforcementBar.alpha =0.2;
/*
    
    Player1ReinforcementLabel = [[UILabel alloc]init];
    Player1ReinforcementLabel.frame = CGRectMake(760-25, 1024/2+40, 40, 40);
    Player1ReinforcementLabel.textColor = [UIColor blackColor];
    Player1ReinforcementLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:Player1ReinforcementLabel];
    [Player1ReinforcementLabel release];
    Player1ReinforcementLabel.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    
    Player2ReinforcementLabel = [[UILabel alloc]init];
    Player2ReinforcementLabel.frame = CGRectMake(760-25, 1024/2-70, 40, 40);
    Player2ReinforcementLabel.textColor = [UIColor blackColor];
    Player2ReinforcementLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:Player2ReinforcementLabel];
    [Player2ReinforcementLabel release];
    Player2ReinforcementLabel.transform = CGAffineTransformMakeRotation(M_PI_2);
  */  
    
    //setup energy bars
    Player1EnergyBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"YellowBar.png"]];
    Player1EnergyBar.frame =CGRectMake(760-25+1, 1024/2,
                                              Player1EnergyBar.image.size.width, Player1EnergyBar.image.size.height);
    [self.view  addSubview:Player1EnergyBar];
    [Player1EnergyBar release];
    Player1EnergyBar.alpha =0.5;
    
    Player1MaxEnergyBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"YellowBar.png"]];
    Player1MaxEnergyBar.frame =CGRectMake(760-25+1, 1024/2,
                                          Player1MaxEnergyBar.image.size.width, Player1MaxEnergyBar.image.size.height);
    [self.view addSubview:Player1MaxEnergyBar];
    [Player1MaxEnergyBar release];
    Player1MaxEnergyBar.alpha =0.2;
    
    Player2EnergyBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"YellowBar.png"]];
    Player2EnergyBar.frame = CGRectMake(760-25+1, 1024/2-Player2EnergyBar.image.size.height,
                                               Player2EnergyBar.image.size.width, Player2EnergyBar.image.size.height);
    
    [self.view  addSubview:Player2EnergyBar];
    [Player2EnergyBar release];
    Player2EnergyBar.alpha =0.5;
    
    Player2MaxEnergyBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"YellowBar.png"]];
    Player2MaxEnergyBar.frame = CGRectMake(760-25+1, 1024/2-Player2MaxEnergyBar.image.size.height,
                                                  Player2MaxEnergyBar.image.size.width, Player2MaxEnergyBar.image.size.height);
    
    [self.view  addSubview:Player2MaxEnergyBar];
    [Player2MaxEnergyBar release];
    Player2MaxEnergyBar.alpha =0.2;
    
    //setup state bound
    StateBound = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StateBound.png"]];
    StateBound.frame = CGRectMake(760-30,1024/2,StateBound.image.size.width, StateBound.image.size.height);
    StateBound.center = CGPointMake(760-25+StateBound.image.size.width/2, 1024/2);
    [self.view  addSubview:StateBound];
    [StateBound release];
   
    TotalBulletAvilable = 50;
    TotalInvadersAvailable = 50;
    
    Player1MaxReinforcement = 100;
    Player2MaxReinforcement = 100;
    
    player1MaxEnergy = 100;
    player2MaxEnergy = 100;
    
    [self NewGame];
   
}

-(void)NewGame{
    Player1Reinforcement = 100;
    Player2Reinforcement = 100;
    
    player1Energy = 100;
    player2Energy = 100;
  
    Fighter.center = CGPointMake(768/2, 920);
    
    for(int i =0; i < 100; i++){
        Player1BulletsAvailable[i] = TRUE;
        Player2InvaderData[i].Active = FALSE;
        Player1bullets[i].center =CGPointMake(100, -200);
        Player2Invaders[i].center =CGPointMake(-200, -200);
        
    }
    
    player1MoveLeft = false;
    player1MoveRight = false;
    gameEnd = false;
    gamePause = false;
    gameTimer = [[NSTimer scheduledTimerWithTimeInterval:2.0/60.0 target:self selector:@selector(UpdateGameEvents) userInfo:nil repeats:YES]retain];
}
-(void)ResumeGame{
    gamePause = false;
    
    gameTimer = [[NSTimer scheduledTimerWithTimeInterval:2.0/60.0 target:self selector:@selector(UpdateGameEvents) userInfo:nil repeats:YES]retain];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //  NSLog(@"touches began");
    UITouch *touch = [touches anyObject];
    //CGPoint touchLocation = [touch locationInView:self.view];
    // NSLog(@"touch at (%i,%i)",(int)touchLocation.x,(int)touchLocation.y);
    
    //    NSSet *allTouches = [event allTouches];
    //    NSLog(@"touches number:%i",allTouches.count);
    //    for(UITouch *touch in allTouches){

    CGPoint touchLocation = [touch locationInView:self.view];
    NSLog(@"touch at (%i,%i)",(int)touchLocation.x,(int)touchLocation.y);
    /*
    if(Help.hidden == false && gamePause == true){
        Help.hidden = true;
        [self ResumeGame];
     return;
     }
     */
    //invader selection
    for(int i=0; i <4; i++)
        if(CGRectContainsPoint(Player2InvaderSelection[i].frame, touchLocation))
            player2invaderselect = Fly+i;
    
    //summon new invader if tap in the dropzon
    if(CGRectContainsPoint(DropZone.frame, touchLocation)){
        if(player2invaderselect ==Fly && player2Energy < 10){
            return;
        }
        else if(player2invaderselect ==Ninja && player2Energy < 50){
            return;
            
        }
        else if(player2invaderselect ==Ram && player2Energy < 20){
            return;
            
        }
        else if(player2invaderselect ==Tank && player2Energy < 30){
            return;
            
        }
        
        bool NoOneThere = TRUE;
        for(int i =0; i < TotalInvadersAvailable; i++)
            if(CGRectContainsPoint(Player2Invaders[i].frame, touchLocation))
                NoOneThere = false;
        
        if(NoOneThere){
            for(int i =0; i < TotalInvadersAvailable; i++){
                if (!Player2InvaderData[i].Active){
                    NSLog(@"New Invader");
                    
                    [Player2InvaderData[i] ActiveAndChangeTypeTo:player2invaderselect];
                    if(Player2InvaderData[i].Type ==Fly){
                        player2Energy -= 10;
                        Player2Invaders[i].image = FlyImage;
                            Player2Invaders[i].frame = CGRectMake(0, 0, Player2Invaders[i].image.size.width, Player2Invaders[i].image.size.width);
                        }
                        else if(Player2InvaderData[i].Type ==Ninja){
                            player2Energy -= 50;
                            Player2Invaders[i].image = NinjaImage;
                            Player2Invaders[i].frame = CGRectMake(0, 0, Player2Invaders[i].image.size.width, Player2Invaders[i].image.size.width);
                        }
                        else if(Player2InvaderData[i].Type ==Ram){
                            player2Energy -= 30;
                            Player2Invaders[i].image = RamImage;
                            Player2Invaders[i].frame = CGRectMake(0, 0, Player2Invaders[i].image.size.width, Player2Invaders[i].image.size.width);
                        }
                        else if(Player2InvaderData[i].Type ==Tank){
                            player2Energy -= 40;
                            Player2Invaders[i].image = TankImage;
                            Player2Invaders[i].frame = CGRectMake(0, 0, Player2Invaders[i].image.size.width, Player2Invaders[i].image.size.width);
                        }
                        Player2Invaders[i].center =CGPointMake(touchLocation.x, touchLocation.y);
                    
                        break;
                        
                    }
                }
            }
        
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    if(CGRectContainsPoint(Player1Pad.frame, touchLocation)){
        if(touchLocation.x >Player1PadOriginPoint.x-60 && touchLocation.x < Player1PadOriginPoint.x +60){
            Player1Pad.center = CGPointMake(touchLocation.x, Player1PadOriginPoint.y);
            
        }
        else if(touchLocation.x < Player1PadOriginPoint.x-60){
            Player1Pad.center = CGPointMake(Player1PadOriginPoint.x-60, Player1PadOriginPoint.y);
        }
        else if(touchLocation.x > Player1PadOriginPoint.x+60){
            Player1Pad.center = CGPointMake(Player1PadOriginPoint.x+60, Player1PadOriginPoint.y);
        }

    }

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];

    
    CGPoint touchLocation = [touch locationInView:self.view];

    if(CGRectContainsPoint(CGRectMake(0, 800, 300, 300), touchLocation))
        Player1Pad.center = Player1PadOriginPoint;
}

-(void)UpdateGameEvents{
    if(gameEnd || gamePause){
        [gameTimer invalidate];
        gameTimer = nil;
        return;
    }
    backGround.frame = CGRectMake(0,backGround.frame.origin.y+1, backGround.image.size.width, backGround.image.size.height);
    if(backGround.frame.origin.y>0)
        backGround.frame = CGRectMake(0, -1024, backGround.image.size.width, backGround.image.size.height);
    int count=0;
    for(int i=0; i < 100;i++)
        if(Player2InvaderData[i].Active)
            count++;
        
   // NSLog(@"Invader Count:%i",count);
    for(int i=0; i < TotalBulletAvilable; i++){
        if(!Player1BulletsAvailable[i])
            Player1bullets[i].center = CGPointMake(Player1bullets[i].center.x, Player1bullets[i].center.y-3);
      //if hit anything
        for(int j =0; j <TotalInvadersAvailable; j++){
            if(CGRectIntersectsRect( Player2Invaders[j].frame,Player1bullets[i].frame) && Player1bullets[i].center.x>0){
                Player1bullets[i].center =CGPointMake(100,-200);
                Player1BulletsAvailable[i] = TRUE;
                //invader lose hp
                Player2InvaderData[j].HP -=1;
                if(Player2InvaderData[j].HP<1){
                    Player2Invaders[j].center = CGPointMake(-200, -200);
                    Player2InvaderData[j].Active = FALSE;
                    
                    if(Player2InvaderData[j].Type==Fly)
                        Player2Reinforcement -= 1;
                    else if(Player2InvaderData[j].Type == Ram)
                        Player2Reinforcement -= 2;
                    else if(Player2InvaderData[j].Type == Tank)
                        Player2Reinforcement -= 3;
                    else if(Player2InvaderData[j].Type == Ninja)
                        Player2Reinforcement -= 5;
                }
            }
        }
        //if bullets out of the border
        if(Player1bullets[i].center.y <60-Player1bullets[i].frame.size.height/2){
            Player1bullets[i].center =CGPointMake(100,-200);
            Player1BulletsAvailable[i] = TRUE;
        }
            
        

    }
    //player1 movement
    
    if(player1MoveLeft == true && Fighter.center.x > 60+Fighter.image.size.width/2)
        Fighter.center = CGPointMake(Fighter.center.x-4, Fighter.center.y);
    if(player1MoveRight ==true && Fighter.center.x < 708-Fighter.image.size.width/2)
        Fighter.center = CGPointMake(Fighter.center.x+4, Fighter.center.y);
    
    if(!Player1Pad.hidden){
        if(Player1Pad.center.x < Player1PadOriginPoint.x  && Fighter.center.x > 60+Fighter.image.size.width/2)
            Fighter.center = CGPointMake(Fighter.center.x-3, Fighter.center.y);
        if(Player1Pad.center.x > Player1PadOriginPoint.x && Fighter.center.x < 708-Fighter.image.size.width/2)
            Fighter.center = CGPointMake(Fighter.center.x+3, Fighter.center.y);
    }
    
    
    //Invader movement
    [self InvaderMovement];
 
    //replenish energy
    [self ReplenishEnergy];
  
    //update energy bar base on energy value
    
    if(player1Energy <0)
        player1Energy =0;
    if(player2Energy<0)
        player2Energy =0;
    float e1 = (float)player1Energy/player1MaxEnergy;
    float e2 = (float)player2Energy/player2MaxEnergy;
    
    Player2EnergyBar.frame = CGRectMake(760-25+1, 1024/2-Player2EnergyBar.image.size.height*e2,
                                               Player2EnergyBar.image.size.width, Player2EnergyBar.image.size.height*e2);
    
    Player1EnergyBar.frame = CGRectMake(760-25+1, 1024/2,
                                               Player1EnergyBar.image.size.width, Player1EnergyBar.image.size.height*e1);

    
    //update reinforcement bar base on the reinforcement value
    if(Player1Reinforcement <0)
        Player1Reinforcement =0;
    if(Player2Reinforcement<0)
        Player2Reinforcement =0;
    float r1 = (float)Player1Reinforcement/Player1MaxReinforcement;
    float r2 = (float)Player2Reinforcement/Player2MaxReinforcement;
    
  /*
    if(Player2ReinforcementBar.frame.size.height > Player2ReinforcementBar.image.size.height*r2)
       Player2ReinforcementBar.frame = CGRectMake(768-15, 1024/2-(Player2ReinforcementBar.frame.size.height-1),
                                                  Player2ReinforcementBar.image.size.width, Player2ReinforcementBar.frame.size.height-1);
    
    if(Player1ReinforcementBar.frame.size.height > Player1ReinforcementBar.image.size.height*r1)
        Player1ReinforcementBar.frame = CGRectMake(768-15, 1024/2,
                                                   Player1ReinforcementBar.image.size.width, Player1ReinforcementBar.frame.size.height-1);
   */
       
    Player2ReinforcementBar.frame = CGRectMake(760-15+2, 1024/2-Player2ReinforcementBar.image.size.height*r2,
                                               Player2ReinforcementBar.image.size.width, Player2ReinforcementBar.image.size.height*r2);
    
    Player1ReinforcementBar.frame = CGRectMake(760-15+2, 1024/2,
                                               Player1ReinforcementBar.image.size.width, Player1ReinforcementBar.image.size.height*r1);
        
  /*  
    Player1ReinforcementLabel.text = [NSString stringWithFormat:@"%i",Player1Reinforcement];
    Player2ReinforcementLabel.text = [NSString stringWithFormat:@"%i",Player2Reinforcement];
    */
    
    if(Player1Reinforcement==0 || Player2Reinforcement==0){
        if(Player1Reinforcement==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"War is End" message:[NSString stringWithFormat:@"Red Win"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"New War",nil];
           
            [alert show];
        }
        else if(Player2Reinforcement ==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"War is End" message:[NSString stringWithFormat:@"Blue Win"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"New War",nil];
           
            [alert show];
        }
        gameEnd = TRUE;
        return;
    }
    for(int i=0; i < 4;i++){
        if(player2invaderselect ==i)
            Player2InvaderSelection[i].alpha =1;
        else
            Player2InvaderSelection[i].alpha =0.15;
    }
    
}
-(void)InvaderMovement{
    //invaders movement
    for(int i =0; i < TotalInvadersAvailable; i++){
        if(Player2InvaderData[i].Active){
            int randmove =0;
            if(Player2InvaderData[i].Type==Ram){
                
                if(Fighter.center.x > Player2Invaders[i].center.x)
                    randmove = 1;
                else if(Fighter.center.x < Player2Invaders[i].center.x)
                    randmove =-1;
            }
            else if(Player2InvaderData[i].Type == Fly){
                randmove = -6;
                if(arc4random()%2==0)
                    randmove *= -1;
                if(Player2Invaders[i].center.x+randmove < 60+Player2Invaders[i].image.size.width/2)
                    randmove = 2;
                if(Player2Invaders[i].center.x+randmove > 708-Player2Invaders[i].image.size.width/2)
                    randmove = -2;
            }
            
            Player2Invaders[i].center = CGPointMake(Player2Invaders[i].center.x+randmove, Player2Invaders[i].center.y+Player2InvaderData[i].Speed);
            
            //if ram in to fighter
            if(CGRectIntersectsRect(Player2Invaders[i].frame,Fighter.frame)){
                Player2Invaders[i].center = CGPointMake(-200, -200);
                Player2InvaderData[i].Active = FALSE;
                
                if(Player2InvaderData[i].Type==Fly)
                    Player1Reinforcement -= 1;
                else if(Player2InvaderData[i].Type==Ram)
                    Player1Reinforcement -= 20;
                else if(Player2InvaderData[i].Type==Ninja)
                    Player1Reinforcement -= 10;
                else if(Player2InvaderData[i].Type==Tank)
                    Player1Reinforcement -= 20;
                
            }
            
            //if reach the other side
            if(Player2Invaders[i].frame.origin.y >1024-60){
                Player2Invaders[i].center = CGPointMake(-200, -200);
                Player2InvaderData[i].Active = FALSE;
                Player1Reinforcement -=2;
            }
        }
        else 
            Player2Invaders[i].center = CGPointMake(-200, -200);
    }
}
-(void)ReplenishEnergy{
    if(player1Energy <100)
        player1Energy += 0.4;
    if(player2Energy <100)
        player2Energy += 0.4;
}
-(void)Player1Fire{
    NSLog(@"Fire");
    if(player1Energy >= 10)
        for(int i=0; i < TotalBulletAvilable;i++){
            if(Player1BulletsAvailable[i]){
                Player1BulletsAvailable[i] = FALSE;
                player1Energy -= 10;
                // Player1bullets[i].frame = CGRectMake(Fighter.center.x, Fighter.center.y,
                //                                    Player1bullets[i].image.size.width, Player1bullets[i].image.size.height);
                Player1bullets[i].center =Fighter.center;
                return;
            }
        }
}
-(void)Player1AltFire{
    if(player1Energy >= 30){
        int bulletfired =0;
       
        for(int i=0; i < TotalBulletAvilable;i++){
            if(Player1BulletsAvailable[i]){
                Player1BulletsAvailable[i] = FALSE;
                
               if(bulletfired==0)
                   Player1bullets[i].center =Fighter.center;
                else if(bulletfired ==1)
                    Player1bullets[i].center = CGPointMake(Fighter.center.x+5, Fighter.center.y);
                else if(bulletfired ==2)
                    Player1bullets[i].center = CGPointMake(Fighter.center.x+10, Fighter.center.y);
                else if(bulletfired ==3)
                    Player1bullets[i].center = CGPointMake(Fighter.center.x-5, Fighter.center.y);
                else if(bulletfired ==4)
                    Player1bullets[i].center = CGPointMake(Fighter.center.x-10, Fighter.center.y);
                else if(bulletfired >=5)
                    break;
                bulletfired +=1;
            }
        }
        player1Energy -= 30;
    }
}
-(void)Player1MoveLeft{
    NSLog(@"Move Left");
    player1MoveLeft = true;
    player1MoveRight = false;
}
-(void)Player1MoveRight{
    NSLog(@"Move Right");
    player1MoveRight = true;
    player1MoveLeft = false;
}
-(void)Player1MoveStop{
    NSLog(@"Move Stop");
    player1MoveRight = FALSE;
    player1MoveLeft = false;
}

-(void)BackToMenu{
    gamePause = true;
    AppDelegate* delegateroot = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    RootViewController *root = [delegateroot GetRootViewController];
    
    [root BackToMenu];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
  
    
    if([title isEqualToString:@"New War"])
    {
        [self NewGame];
    }
    
}

/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
*/
@end
