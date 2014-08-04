//
//  StartMenu.h
//  FinalProject_DodgingGame
//
//  Created by iD Student on 8/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface StartMenu : CCLayer {
    CCSprite *play;
    NSMutableArray *deleplay;
    NSMutableArray *holdplay;
}
+(id)scene;

@end
