//
//  HelloWorldLayer.h
//  FinalProject_DodgingGame
//
//  Created by iD Student on 7/26/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCSprite *thumb;
	BOOL isPressed;
    
	
    NSMutableArray *projectilesToDelete ;
    int xc;
    int te;
        CGPoint pointy;
    CCRotateBy *turnBy;
    CCSprite *player;
    CCSprite *enemy2;
    CCSprite *enemy1;
    NSMutableArray *clearer;
    CCSprite *clean;
    CCSprite *enemy3;
    NSMutableArray *enemydelete; 
    NSMutableArray *deletehealth;
     NSMutableArray *playerarray; 
    NSMutableArray *enemytwodelete;
    NSMutableArray *shockdele;
    NSMutableArray *removing;
    CCSprite *deleter;
      NSMutableArray *removingdele;
    NSMutableArray *shockwave ;
    NSMutableArray *damagewave ;
        NSMutableArray *deletewave ;
    CGRect  deleterRect;
    CCSprite *lives;
    int co;
    int x;
   int xj;
    int yj;
    int y ;
    int h ;
    NSMutableArray *proj;
    NSMutableArray *li;
    NSMutableArray *enemy;
      NSMutableArray *enemytwo;
    NSMutableArray *enemythree;
    NSMutableArray *enemythreedelete;
    NSMutableArray *enemythreedelete2;
    CGPoint v;
    CGRect erp;
    int fy;
    int gjk ;
    CCProgressTimer *progressTimer;
    int life;
    CCParticleExplosion *explode;
    CCParticleExplosion *emitter;
    CCParticleExplosion *ene3p;
    CCParticleExplosion *enemyex;
    CCParticleExplosion *explo;
    CCParticleExplosion *damage;
    CCParticleExplosion *ene3h;
    BOOL isObjectMoving;
     BOOL isObjectMoving1;

    int j;
    int u;
    int p;
    int uio;
    NSString *t;
    NSString *l;
    int enetwset;
    int b;
    int c;
    NSMutableArray *power;
    NSString *lifey;
    CCLabelTTF *lifecount;
    NSMutableArray *lifeholder;
    int projcount;
    
}

@property(nonatomic, retain)CCProgressTimer*progressTimer;
@property(nonatomic, assign)int life;
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
