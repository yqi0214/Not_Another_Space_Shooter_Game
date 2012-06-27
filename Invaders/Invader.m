//
//  Invader.m
//  Invaders
//
//  Created by Yangfan Qi on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Invader.h"

@implementation Invader
@synthesize Active;
@synthesize Type;
@synthesize HP;
@synthesize Speed;
@synthesize EnergyCost;
@synthesize DamageIfPass;
@synthesize DamageIfCrush;
@synthesize DamageIfKilled;


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        Active = false;
        HP = 1;
        Type = Fly;
        Speed = 1;
        EnergyCost = 10;
        DamageIfPass = 2;
        DamageIfCrush = 1;
        DamageIfKilled = 1;
    }
    
    return self;
}

-(id)initWithType:(int)type{
    if (self = [super init]) {
        Type = type;
        if(Type==Fly){
            HP = 1;
            Speed = 2;
            EnergyCost = 10;
            DamageIfKilled = 1;
        }
        else if(Type == Rammer){
            HP = 3;
            Speed = 3;
            EnergyCost = 10;
            DamageIfKilled = 1;
        }
        else if(Type == Ninja){
            HP = 1;
            Speed = 5;
            EnergyCost = 10;
            DamageIfKilled = 1;
        }
        else if(Type == Tank){
            HP = 10;
            Speed = 1;
            EnergyCost = 10;
            DamageIfKilled = 1;
        }
        Active = false;
    }
    return self;
}

-(void)ActiveAndChangeTypeTo:(int)type{
    Type = type;
    if(Type==Fly){
        HP = 1;
        Speed = 2;
        EnergyCost = 10;
        DamageIfPass = 2;
        DamageIfCrush = 1;
        DamageIfKilled = 1;
    }
    else if(Type == Rammer){
        HP = 3;
        Speed = 3;
        EnergyCost = 20;
        DamageIfPass = 2;
        DamageIfCrush = 20;
        DamageIfKilled = 2;
    }
    else if(Type == Ninja){
        HP = 1;
        Speed = 5;
        EnergyCost = 50;
        DamageIfPass = 5;
        DamageIfCrush = 10;
        DamageIfKilled = 5;
    }
    else if(Type == Tank){
        HP = 10;
        Speed = 1;
        EnergyCost = 50;
        DamageIfPass = 3;
        DamageIfCrush = 20;
        DamageIfKilled = 3;
    }
    Active = true;
}
@end
