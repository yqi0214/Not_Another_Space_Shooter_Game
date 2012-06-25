//
//  PlayerController.h
//  Invaders
//
//  Created by Yangfan Qi on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerController : NSObject{
    BOOL AIPlayer;
    float currentEnergy;
    float currentResource;
    float maxEnergy;
    float maxResource;
}
-(void)ResetPlayerValues;
@property (nonatomic,assign) BOOL AIPlayer;
@property (nonatomic,assign) float currentEnergy;
@property (nonatomic,assign) float currentResource;
@property (nonatomic,assign) float maxEnergy;
@property (nonatomic,assign) float maxResource;

@end
