//
//  GamePlayView.m
//  Space Invaders?
//
//  Created by Yangfan Qi on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GamePlayView.h"

@interface GamePlayView ()

@end

@implementation GamePlayView

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.multipleTouchEnabled = YES;
    self.view.backgroundColor = [UIColor blackColor];
    
    DropZone = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DropZone.png"]];
    DropZone.frame = CGRectMake(60, 60, DropZone.image.size.width, DropZone.image.size.height);
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
    Player1FireButton.frame = CGRectMake(650, 970, 50, 50);
    // Player1FireButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    //[FireButton setTitle:@"Fire" forState:UIControlStateNormal];
    [Player1FireButton setBackgroundImage:[UIImage imageNamed:@"FireButton"] forState:UIControlStateNormal];
    [Player1FireButton setBackgroundImage:[UIImage imageNamed:@"FireButton"] forState:UIControlStateSelected];
    // Player1FireButton
    [self.view addSubview:Player1FireButton];
    [Player1FireButton addTarget:self action:@selector(Player1Fire) forControlEvents:UIControlEventTouchDown];
    
    
    Player1MoveArrow[0] = [UIButton buttonWithType:UIButtonTypeCustom];
    Player1MoveArrow[0].frame = CGRectMake(50, 970, 50, 50);
    [Player1MoveArrow[0] setBackgroundImage:[UIImage imageNamed:@"Arrow.png"] forState:UIControlStateNormal];
    [Player1MoveArrow[0] setBackgroundImage:[UIImage imageNamed:@"Arrow.png"] forState:UIControlStateSelected];
    Player1MoveArrow[0].transform = CGAffineTransformMakeRotation(M_PI);
    [self.view addSubview:Player1MoveArrow[0]];
    [Player1MoveArrow[0] addTarget:self action:@selector(Player1MoveLeft) forControlEvents:UIControlEventTouchDown];
    [Player1MoveArrow[0] addTarget:self action:@selector(Player1MoveStop) forControlEvents:UIControlEventTouchUpInside];
    [Player1MoveArrow[0] addTarget:self action:@selector(Player1MoveStop) forControlEvents:UIControlEventTouchUpOutside];
    
    
    Player1MoveArrow[1] = [UIButton buttonWithType:UIButtonTypeCustom];
    Player1MoveArrow[1].frame = CGRectMake(130, 970, 50, 50);
    [Player1MoveArrow[1] setBackgroundImage:[UIImage imageNamed:@"Arrow.png"] forState:UIControlStateNormal];
    [Player1MoveArrow[1] setBackgroundImage:[UIImage imageNamed:@"Arrow.png"] forState:UIControlStateSelected];
    [self.view addSubview:Player1MoveArrow[1]];
    [Player1MoveArrow[1] addTarget:self action:@selector(Player1MoveRight) forControlEvents:UIControlEventTouchDown];
    [Player1MoveArrow[1] addTarget:self action:@selector(Player1MoveStop) forControlEvents:UIControlEventTouchUpInside];
    [Player1MoveArrow[1] addTarget:self action:@selector(Player1MoveStop) forControlEvents:UIControlEventTouchUpOutside];
    
    
   
    
    Player1ReinforcementBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlueBar.png"]];
    Player1ReinforcementBar.frame =CGRectMake(768-15, 1024/2,
                                              Player1ReinforcementBar.image.size.width, Player1ReinforcementBar.image.size.height);
    [self.view  addSubview:Player1ReinforcementBar];
    [Player1ReinforcementBar release];
    Player1ReinforcementBar.alpha =0.5;
    
    Player2ReinforcementBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RedBar.png"]];
    Player2ReinforcementBar.frame = CGRectMake(768-15, 1024/2-Player2ReinforcementBar.image.size.height,
                                               Player2ReinforcementBar.image.size.width, Player2ReinforcementBar.image.size.height);
    
    [self.view  addSubview:Player2ReinforcementBar];
    [Player2ReinforcementBar release];
    Player2ReinforcementBar.alpha =0.5;
    
    Player1MaxReinforcementBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlueBar.png"]];
    Player1MaxReinforcementBar.frame =CGRectMake(768-15, 1024/2,
                                              Player1MaxReinforcementBar.image.size.width, Player1MaxReinforcementBar.image.size.height);
    [self.view  addSubview:Player1MaxReinforcementBar];
    [Player1MaxReinforcementBar release];
    Player1MaxReinforcementBar.alpha =0.2;
    
    Player2MaxReinforcementBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RedBar.png"]];
    Player2MaxReinforcementBar.frame = CGRectMake(768-15, 1024/2-Player2MaxReinforcementBar.image.size.height,
                                               Player2MaxReinforcementBar.image.size.width, Player2MaxReinforcementBar.image.size.height);
    
    [self.view  addSubview:Player2MaxReinforcementBar];
    [Player2MaxReinforcementBar release];
    Player2MaxReinforcementBar.alpha =0.2;

    
    Player1ReinforcementLabel = [[UILabel alloc]init];
    Player1ReinforcementLabel.frame = CGRectMake(768-25, 1024/2+40, 40, 40);
    Player1ReinforcementLabel.textColor = [UIColor blackColor];
    Player1ReinforcementLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:Player1ReinforcementLabel];
    [Player1ReinforcementLabel release];
    Player1ReinforcementLabel.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    
    Player2ReinforcementLabel = [[UILabel alloc]init];
    Player2ReinforcementLabel.frame = CGRectMake(768-25, 1024/2-40, 40, 40);
    Player2ReinforcementLabel.textColor = [UIColor blackColor];
    Player2ReinforcementLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:Player2ReinforcementLabel];
    [Player2ReinforcementLabel release];
    Player2ReinforcementLabel.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    
    
    
    TotalBulletAvilable = 5;
    TotalInvadersAvailable = 10;
    
    Player1MaxReinforcement = 100;
    Player2MaxReinforcement = 100;
    
    [self NewGame];
   
}

-(void)NewGame{
    Player1Reinforcement = 100;
    Player2Reinforcement = 100;
  
    Fighter.center = CGPointMake(768/2, 920);
    
    for(int i =0; i < 100; i++){
        Player1BulletsAvailable[i] = TRUE;
        Player2InvaderData[i].Active = FALSE;
        Player1bullets[i].center =CGPointMake(100, -200);
        Player2Invaders[i].center =CGPointMake(-200, -200);
        
    }
    
    
    gameEnd = false;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(UpdateGameEvents) userInfo:nil repeats:YES];
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
        
    if(CGRectContainsPoint(DropZone.frame, touchLocation)){
        
        
        /*
        if(CGRectContainsPoint(Player1MoveArrow[0].frame, touchLocation)){
            NSLog(@"Move Left");
            player1MoveLeft = true;
            player1MoveRight = false;
            return;
            //Fighter.center = CGPointMake(Fighter.center.x-2, Fighter.center.y);
        }
        
        else if(CGRectContainsPoint(Player1MoveArrow[1].frame, touchLocation)){
            NSLog(@"Move Right");
            player1MoveRight = true;
            player1MoveLeft = false;
            return;
            //Fighter.center = CGPointMake(Fighter.center.x+2, Fighter.center.y);
        }*/
       // else{
            bool NoOneThere = TRUE;
            for(int i =0; i < TotalInvadersAvailable; i++)
                if(CGRectContainsPoint(Player2Invaders[i].frame, touchLocation))
                    NoOneThere = false;
                   
            
            if(NoOneThere){
                for(int i =0; i < TotalInvadersAvailable; i++){
                    if (!Player2InvaderData[i].Active){
                        NSLog(@"New Invader");
                        Player2Invaders[i].center =CGPointMake(touchLocation.x, touchLocation.y);
                       // Player2InvaderData[i].Active = TRUE;
                        [Player2InvaderData[i] ActiveAndChangeTypeTo:arc4random()%5];
                       // [Player2InvaderData[i] ActiveAndChangeTypeTo:Ram];
                        break;
                        
                    }
                }
            }
        //}
    
    
    
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
 
    //player1MoveLeft = false;
    //player1MoveRight = false;
}

-(void)UpdateGameEvents{
    if(gameEnd){
        [timer invalidate];
        timer = nil;
        return;
    }
    int count=0;
    for(int i=0; i < 100;i++)
        if(Player2InvaderData[i].Active)
            count++;
        
    NSLog(@"Invader Count:%i",count);
    for(int i=0; i < TotalBulletAvilable; i++){
        if(!Player1BulletsAvailable[i])
            Player1bullets[i].center = CGPointMake(Player1bullets[i].center.x, Player1bullets[i].center.y-3);
      //if hit anything
        for(int j =0; j <TotalInvadersAvailable; j++){
            if(CGRectIntersectsRect( Player2Invaders[j].frame,Player1bullets[i].frame) && Player1bullets[i].center.x>0){
                Player1bullets[i].center =CGPointMake(100,-200);
                Player1BulletsAvailable[i] = TRUE;
                Player2Invaders[j].center = CGPointMake(-200, -200);
                Player2InvaderData[j].Active = FALSE;
                Player2Reinforcement -=1;
            }
        }
        //if bullets out of the border
        if(Player1bullets[i].center.y <60-Player1bullets[i].frame.size.height/2){
            Player1bullets[i].center =CGPointMake(100,-200);
            Player1BulletsAvailable[i] = TRUE;
        }
            
        

    }
    
    if(player1MoveLeft == true && Fighter.center.x > 60+Fighter.image.size.width/2)
        Fighter.center = CGPointMake(Fighter.center.x-2, Fighter.center.y);
    if(player1MoveRight ==true && Fighter.center.x < 708-Fighter.image.size.width/2)
        Fighter.center = CGPointMake(Fighter.center.x+2, Fighter.center.y);
    
    //Invader movement
    [self InvaderMovement];
 
   
    //update reinforcement bar base on the reinforcement value
    
    if(Player1Reinforcement <0)
        Player1Reinforcement =0;
    if(Player2Reinforcement<0)
        Player2Reinforcement =0;
    float r1 = (float)Player1Reinforcement/Player1MaxReinforcement;
    float r2 = (float)Player2Reinforcement/Player2MaxReinforcement;
    
   
    Player2ReinforcementBar.frame = CGRectMake(768-15, 1024/2-Player2ReinforcementBar.image.size.height*r2,
                                               Player2ReinforcementBar.image.size.width, Player2ReinforcementBar.image.size.height*r2);
    Player1ReinforcementBar.frame = CGRectMake(768-15, 1024/2,
                                               Player1ReinforcementBar.image.size.width, Player1ReinforcementBar.image.size.height*r1);
    
    Player1ReinforcementLabel.text = [NSString stringWithFormat:@"%i",Player1Reinforcement];
    Player2ReinforcementLabel.text = [NSString stringWithFormat:@"%i",Player2Reinforcement];
    
    
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
    
}
-(void)InvaderMovement{
    //invaders movement
    for(int i =0; i < TotalInvadersAvailable; i++){
        
        if(Player2InvaderData[i].Active){
            /*int randmove = -3;
             if(arc4random()%2==0)
             randmove *= -1;
             if(Invaders[i].center.x+randmove < 0+Invaders[i].image.size.width/2 ||Invaders[i].center.x+randmove > 768-Invaders[i].image.size.width/2)
             randmove *= -1;
             */
            int randmove =0;
            if(Player2InvaderData[i].Type==Ram){
                
                if(i%2==0 && Fighter.center.x > Player2Invaders[i].center.x)
                    randmove = 1;
                else if(i%2==0 && Fighter.center.x < Player2Invaders[i].center.x)
                    randmove =-1;
            }
            else if(Player2InvaderData[i].Type == Fly){
                randmove = -2;
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
                // self.view.backgroundColor = [UIColor redColor];
                Player2Invaders[i].center = CGPointMake(-200, -200);
                Player2InvaderData[i].Active = FALSE;
                Player1Reinforcement -= 20;
            }
            
            
            if(Player2Invaders[i].center.y >1024){
                Player2Invaders[i].center = CGPointMake(-200, -200);
                Player2InvaderData[i].Active = FALSE;
                Player1Reinforcement -=2;
            }
        }
        else 
            Player2Invaders[i].center = CGPointMake(-200, -200);
    }
}
-(void)Player1Fire{
    NSLog(@"Fire");
    for(int i=0; i < TotalBulletAvilable;i++){
        if(Player1BulletsAvailable[i]){
            Player1BulletsAvailable[i] = FALSE;
                Player1bullets[i].frame = CGRectMake(Fighter.center.x, Fighter.center.y,
                                                     Player1bullets[i].image.size.width, Player1bullets[i].image.size.height);
                return;
            }
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
