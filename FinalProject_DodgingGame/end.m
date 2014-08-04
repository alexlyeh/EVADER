//
//  end.m
//  FinalProject_DodgingGame
//
//  Created by iD Student on 7/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "end.h"
#import "HelloWorldLayer.h"
#import "StartMenu.h"

@implementation end

int p;

+(id)scene;
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	end *layer = [end node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
    
}
-(id) init
{

    
    
	if( (self=[super init])) {
        self.isTouchEnabled = YES;
        NSString *t = [NSString stringWithFormat:@"Score: "];
        NSString *v = [[NSNumber numberWithInt: p] stringValue];
       t =  [t stringByAppendingFormat: v];
         CGSize size = [[CCDirector sharedDirector] winSize];
        CCMenuItemImage *menubutton = [CCMenuItemImage itemFromNormalImage:@"Retry.png" selectedImage:@"RetryPushed.png" target:self selector:@selector(doThis:)];
        CCMenuItemImage *startbutton = [CCMenuItemImage itemFromNormalImage:@"Menu.png" selectedImage:@"MenuPressed.png" target:self selector:@selector(doThisThing:)];
        startbutton.position = ccp(0,size.height/3);
        CCLabelTTF *score =[CCLabelTTF labelWithString: t  fontName:@"Marker Felt" fontSize:24] ;
        score.position = ccp( size.width /2 , size.height/3-10 );
        //CCLabelTTF *num =[CCLabelTTF labelWithString: v  fontName:@"Marker Felt" fontSize:24] ;
       // num.position = ccp( size.width /2 + 30 , size.height/3 -10);
        CCLabelTTF *gameover =[CCLabelTTF labelWithString: @"Game Over"  fontName:@"Marker Felt" fontSize:24];
        
        gameover.position = ccp( size.width /2 , size.height/3 + 90);
        CCMenu *menu = [CCMenu menuWithItems:menubutton,startbutton,nil];
        menu.position = ccp(size.width/2,size.height/2 -20);
       

        [self addChild:menu];
        [self addChild: score];
        //[//self addChild: num];
        [self addChild: gameover];
        return self;
    }
}
    

-(void)doThis:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer node]]];
}
-(void)doThisThing:(id)sender{
        [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[StartMenu node]]];
}

+(void)setP:(int)input
{
    p = input;
    
}


@end
