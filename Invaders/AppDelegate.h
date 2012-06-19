//
//  AppDelegate.h
//  Invaders
//
//  Created by Yangfan Qi on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    RootViewController *root;
}
-(RootViewController*)GetRootViewController;
@property (strong, nonatomic) UIWindow *window;

@end
