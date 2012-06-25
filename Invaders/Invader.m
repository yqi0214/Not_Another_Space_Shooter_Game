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

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        Active = false;
        HP = 1;
        Type = Fly;
        Speed = 1;
    }
    
    return self;
}

-(id)initWithType:(int)type{
    if (self = [super init]) {
        Type = type;
        if(Type==Fly){
            HP = 1;
            Speed = 2;
        }
        else if(Type == Ram){
            HP = 3;
            Speed = 3;
        }
        else if(Type == Ninja){
            HP = 1;
            Speed = 5;
        }
        else if(Type == Tank){
            HP = 10;
            Speed = 1;
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
    }
    else if(Type == Ram){
        HP = 3;
        Speed = 3;
    }
    else if(Type == Ninja){
        HP = 1;
        Speed = 5;
    }
    else if(Type == Tank){
        HP = 10;
        Speed = 1;
    }
    Active = true;
}
@end
