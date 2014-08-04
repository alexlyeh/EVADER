//
//  Intructions.m
//  Evader
//
//  Created by iD Student on 8/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Intructions.h"
#import "StartMenu.h"

@implementation Intructions
+(id)scene;
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Intructions *layer = [Intructions node];
	
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
        imagea = [[NSMutableArray alloc]init];
        NSMutableString *zero = [NSMutableString stringWithString:@"InstuctText0.png"];
        NSMutableString *one = [NSMutableString stringWithString:@"Intruct1.png"];
        NSMutableString *two = [NSMutableString stringWithString:@"Instruct2.png"];
        NSMutableString *three = [NSMutableString stringWithString:@"Instruct3.png"];
        NSMutableString *four = [NSMutableString stringWithString:@"Instruct4.png"];
          NSMutableString *five = [NSMutableString stringWithString:@"Instruct5.png"];
        [imagea addObject:zero];
        [imagea addObject:one];
        [imagea addObject:two];
        [imagea addObject:three];
        [imagea addObject:four];
        [imagea addObject:five];
        
        

         i = 0;
        
        InstructText= [CCSprite spriteWithFile:[imagea objectAtIndex:0]];
        InstructText.position = ccp(size.width/2,size.height/2);
        
        CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"Back.png" selectedImage:@"BakcPressed.png"target:self selector:@selector(doThis:)];
        CCMenuItemImage *next = [CCMenuItemImage itemFromNormalImage:@"Next.png" selectedImage:@"Nextp.png" target:self selector:@selector(imagesw:)];
        next.position = ccp( back.position.x + 350, back.position.y);
        CCMenu *menu = [CCMenu menuWithItems:back,next, nil];
        menu.position = ccp(60,25);
        [self addChild:menu z:2];
        [self addChild:InstructText];
        
        
        
        
               return self;
    }
}
-(void)doThis:(id)sender{
 [[CCDirector sharedDirector]replaceScene:[CCTransitionZoomFlipAngular transitionWithDuration:2 scene:[StartMenu node]]];
}
-(void)imagesw:(id)sender{
    
    i++;
    if(i >  5){
        i = 0;
    }
    
    NSLog(@"%@",[imagea objectAtIndex:i]);
       CGSize size = [[CCDirector sharedDirector] winSize];
    InstructText= [CCSprite spriteWithFile:[imagea objectAtIndex:i]];
    InstructText.position = ccp(size.width/2,size.height/2);
    [self addChild:InstructText];
}

@end
