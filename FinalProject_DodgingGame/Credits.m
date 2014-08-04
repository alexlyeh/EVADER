//
//  Credits.m
//  Evader
//
//  Created by Alex Yeh on 12/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Credits.h"
#import "StartMenu.h"

@implementation Credits
+(id)scene;
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Credits *layer = [Credits node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
    
}


-(id) init
{
	if( (self=[super init])) {
        self.isTouchEnabled = YES;
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *creditimage= [CCSprite spriteWithFile:@"CreditPage.png"];
        creditimage.position = ccp(size.width/2,(size.height/2)+15 );

        CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"Back.png" selectedImage:@"BakcPressed.png"target:self selector:@selector(doThis:)];
        CCMenu *menu = [CCMenu menuWithItems:back, nil];
        menu.position = ccp(size.width/2,25);
        [self addChild:menu z:2];
        [self addChild:creditimage];
        
                return self;
    }
}

-(void)doThis:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionZoomFlipX transitionWithDuration:2 scene:[StartMenu node]]];
}

@end
