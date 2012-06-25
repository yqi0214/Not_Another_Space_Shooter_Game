//
//  PlayerController.m
//  Invaders
//
//  Created by Yangfan Qi on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerController.h"

@implementation PlayerController
@synthesize AIPlayer;
@synthesize currentEnergy;
@synthesize maxEnergy;
@synthesize currentResource;
@synthesize maxResource;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        AIPlayer = FALSE;
        currentEnergy = 100;
        currentResource = 100;
        maxEnergy =100;
        maxResource =100;
        
    }
    
    return self;
}
-(void)ResetPlayerValues{
    currentEnergy =100;
    currentResource = 100;
}
@end
