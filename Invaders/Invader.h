//
//  Invader.h
//  Invaders
//
//  Created by Yangfan Qi on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Invader : NSObject{
    BOOL Active;
    int Type;
    int HP;
    int Speed;
    int EnergyCost;
    int DamgeIfPass;
    int DamgeIfCrush;
    int DamageIfKilled;
}
-(id)initWithType:(int)type;
-(void)ActiveAndChangeTypeTo:(int)type;

@property (nonatomic,assign) BOOL Active;
@property (nonatomic,assign) int Type;
@property (nonatomic,assign) int HP;
@property (nonatomic,assign) int Speed;
@property (nonatomic,assign) int EnergyCost;
@property (nonatomic,assign) int DamageIfPass;
@property (nonatomic,assign) int DamageIfCrush;
@property (nonatomic,assign) int DamageIfKilled;
@end
