//
//  StartMenu.m
//  FinalProject_DodgingGame
//
//  Created by iD Student on 8/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StartMenu.h"
#import "HelloWorldLayer.h"
#import "Intructions.h"
#import "SimpleAudioEngine.h"
#import "Credits.h"
@implementation StartMenu
+(id)scene;
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StartMenu *layer = [StartMenu node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
    
}
-(id) init
{
	if( (self=[super init])) {
        self.isTouchEnabled = YES;
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Title.wav"];

        
        deleplay = [[NSMutableArray alloc] init];
        holdplay = [[NSMutableArray alloc] init];
         play = [CCSprite spriteWithFile:@"enemy1.png"];
        [holdplay addObject:play];
          CGSize size = [[CCDirector sharedDirector] winSize];
       // CCSprite *background = [CCSprite spriteWithFile:@"Mainmenu.png"];
       // background.position = ccp(size.width/2, size.height/2);
        //[self addChild:background];
        CCMenuItemImage *StartButton = [CCMenuItemImage itemFromNormalImage:@"Start.png" selectedImage:@"StartPushed.png"target:self selector:@selector(doThis:)];
        
        
        CCLabelTTF *title =[CCLabelTTF labelWithString: @"Ev  der"  fontName:@"Copperplate" fontSize:45];
    
        
        title.position = ccp(size.width/2, size.height/2 + 60);
        play.position = ccp(size.width/2-14, size.height/2 + 59);
        
        [self addChild:title];
        [self addChild:play];
        CCMenuItemImage *intruct = [CCMenuItemImage itemFromNormalImage:@"Intructions.png" selectedImage:@"InstructionsPressed.png"target:self selector:@selector(doThisThing:)];
        CCMenuItemImage *credits = [CCMenuItemImage itemFromNormalImage:@"Credits.png" selectedImage:@"CreditsP.png" target:self selector:@selector(creditspage:)];
        intruct.position = ccp(0,-50);
        credits.position = ccp(0,-100);
        CCMenu *menu = [CCMenu menuWithItems:StartButton,intruct,credits, nil];
        [self addChild:menu];
        
      
        return self;
    }
}
-(void)doThis:(id)sender{
    CCParticleExplosion *explode = [[CCParticleExplosion alloc] init];
    explode.texture = [[CCTextureCache sharedTextureCache]addImage:@"particle.png"];
    explode.position = play.position;
     [self addChild:explode];
    
    for(CCSprite *player in holdplay){
        
        [deleplay addObject:player];
    }
    for(CCSprite *dele in deleplay){
        [holdplay removeObject:dele];
        [self removeChild:dele cleanup:YES];
    }
    //NSLog(@"%i",[holdplay count]);
       [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:4 scene:[HelloWorldLayer node]]];
  
}


-(void)creditspage:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionSplitCols transitionWithDuration:0.5 scene:[Credits node]]];
    
}
    
    
    

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView: [myTouch view]];
    location = [[CCDirector sharedDirector]convertToGL:location];
    CCParticleExplosion *explode = [[CCParticleExplosion alloc] init];
    explode.texture = [[CCTextureCache sharedTextureCache]addImage:@"particle.png"];
    explode.position = location;
    [self addChild:explode];

    
    
    
}
-(void)doThisThing:(id)sender{
    
[[CCDirector sharedDirector]replaceScene:[CCTransitionRotoZoom transitionWithDuration:0.5 scene:[Intructions node]]];
}


@end
