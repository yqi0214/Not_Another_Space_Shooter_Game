//
//  GameMenuView.h
//  Invaders
//
//  Created by Yangfan Qi on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameMenuView : UIViewController{
    BOOL goodToGo;
    BOOL gameStarted;
    
    UIImageView *background;
   
    
    UILabel *gameTitle;
  
    
    UIButton *newGameButton;
    UIButton *resumeGameButton;
}

@end
