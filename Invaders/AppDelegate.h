//
//  AppDelegate.h
//  Invaders
//
//  Created by Yangfan Qi on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePlayView.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    GamePlayView* root;
}

@property (strong, nonatomic) UIWindow *window;

@end
