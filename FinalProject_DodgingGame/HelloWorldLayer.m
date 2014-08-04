//
//  HelloWorldLayer.m
//  EVADER 
//
//  Created on 7/26/12.
//  Copyright Alex Yeh 2012. All rights reserved.
//

#import "HelloWorldLayer.h"
#import "end.h"
#import "StartMenu.h"
#import "SimpleAudioEngine.h"


@implementation HelloWorldLayer
@synthesize progressTimer;
@synthesize life;

+(CCScene *) scene
{
	
	CCScene *scene = [CCScene node];
	

	HelloWorldLayer *layer = [HelloWorldLayer node];
	

	[scene addChild: layer];
	

	return scene;
}


-(id) init
{
	
	if( (self=[super init])) {
      
      self.isTouchEnabled = YES;
        
       [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"AppMusic.wav"];
        

       player= [CCSprite spriteWithFile:@"Player.png"];
        player.position = ccp(30, 50);
        playerarray = [[NSMutableArray alloc] init];
        [playerarray addObject:player];
                h = 30;
        uio = 0;
        clearer = [[NSMutableArray alloc]init];
        enemythree = [[NSMutableArray alloc]init];
        proj = [[NSMutableArray alloc] init ];
        enemytwo=[[NSMutableArray alloc] init ];
        projectilesToDelete  = [[NSMutableArray alloc]init];
        enemy = [[NSMutableArray alloc] init];
        shockwave = [[NSMutableArray alloc] init];
         shockdele = [[NSMutableArray alloc] init];
                
         removingdele = [[NSMutableArray alloc]init];
        CCSprite*part =[CCSprite spriteWithFile:@"Start.png" ];
        part.position = ccp(40000,40000);
        deleter= [CCSprite spriteWithFile:@"Menu.png"];
        deleter.position = ccp(20000,20000);
        erp = CGRectMake(part.position.x,part.position.y,1,1);

         deleterRect= CGRectMake(deleter.position.x, deleter.position.y, 1, 1); 
        [self addChild:deleter];
        turnBy= [CCRotateBy actionWithDuration:1 angle:1080];
        c = 0;
         b = 2;
        projcount = 0;
        [self addChild:player];
        fy = 0;
        for(int i =0; i <=1; i++ ){
            [self enemy1];
           
            }
        power= [[NSMutableArray alloc] init];
        CCRotateBy *rotation = [CCRotateBy actionWithDuration:1 angle:500];
        CCRepeatForever * repeatforever = [CCRepeatForever actionWithAction:rotation];
        [player runAction:repeatforever];

        
        [self schedule:@selector(gameLoop:)];
    
         

        co = 0;
    
            
           enetwset = 10;

    }   
        [self lives];
           
    

    
	return self;
}


-(void)enemy1{
    gjk= arc4random()%6;
    enemy1 = [CCSprite spriteWithFile:@"enemy1.png"];
    
    
    int d = arc4random()%480+480;
    int o = arc4random()%320+320;
     x = arc4random()%480;
    if( x <= 480 && x>= 460){
        x=x-100;
    }
    if(x <= 100){
        x = x+50;
    }
    
    y = arc4random()%320;
    if(y <=320 && y >= 290){
        y = y-100;
    }
    if(y < 100){
        y = y + 100;
    }
    enemy1.position = ccp(o,d);
       CCRotateBy *rotation = [CCRotateBy actionWithDuration:20 angle:1080];
    CCRepeatForever * repeatforever = [CCRepeatForever actionWithAction:rotation];
    [enemy1 runAction:repeatforever];
   [enemy1 runAction:[CCSequence actions:
                      [CCMoveTo actionWithDuration:3 position: ccp(x,y)], [CCCallFunc actionWithTarget:self selector:@selector(startShooting)],nil]];
    [self addChild:enemy1];
    [enemy addObject :enemy1];
   
    
 
}
- (void) startShooting
{
//    // start scheduling your projectile to fire every 2.5 seconds
    [self schedule:@selector(projectileShooting:) interval:2.5];
}
-(void)enemy2{
    
    enemy2 = [CCSprite spriteWithFile:@"enemy2.png"];
    int d = arc4random()%480+480;
    int o = arc4random()%320+320;
    x = arc4random()%480;
    if( x <= 480 && x>= 460){
        x=x-100;
    }
    if(x <= 100){
        x = x+50;
    }
    
    y = arc4random()%320;
    if(y <=320 && y >= 290){
        y = y-100;
    }
    if(y < 100){
        y = y + 100;
    }
    enemy2.position = ccp(o,d);
   
    xc = x;
    te = y;
       [enemytwo addObject :enemy2];
   
      
    //[end setP:p];
    
    [self addChild:enemy2];
    
    for(CCSprite *enetw in enemytwo){
       
        CCRotateBy *rotation = [CCRotateBy actionWithDuration:15 angle:1080];
        CCRepeatForever * repeatforever = [CCRepeatForever actionWithAction:rotation];
        
    
        
        int f = arc4random()%480;
        int s = arc4random()%320;      //int tc = xc;
        if( f <= 480 && f>= 460){
            f=f-100;
        }
        if(f <= 100){
            f = f+50;
        }
        
        s = arc4random()%320;
        if(s <=320 && s >= 290){
            s = s-100;
        }
        if(s < 100){
            s = s + 100;
        }

        CCMoveTo *move = [CCMoveTo actionWithDuration:1 position:ccp(f,s)];
        CCCallBlock *end = [CCCallBlock actionWithBlock:^{
            isObjectMoving = YES;
        }];
        
        isObjectMoving = NO;
        
        [enetw runAction:[CCSequence actions:move,end,nil]];
     
        
        [enetw runAction: repeatforever];
        [enetw runAction:[CCSequence actions:move, nil]];
       // NSLog(@"%i",x);        
        
        
    }

}
-(void)enemy3{
    enemy3 = [CCSprite spriteWithFile:@"enemy3.png"];
    
    
    int d = arc4random()%480+480;
    int o = arc4random()%320+320;
    xj = arc4random()%480;
    if( xj <= 480 && xj>= 460){
        xj=xj-100;
    }
    if(xj <= 100){
        xj = xj+50;
    }
    
    yj = arc4random()%320;
    if(yj <=320 && yj >= 290){
        yj = yj-100;
    }
    if(yj < 100){
        yj = yj + 100;
    }
    enemy3.position = ccp(o,d);
    CCMoveTo *mov = [CCMoveTo actionWithDuration:3 position: ccp(xj,yj)];
    CCRotateBy *rotation = [CCRotateBy actionWithDuration:20 angle:1080];
    CCScaleBy *sc = [CCScaleBy actionWithDuration:7 scale:3];
    CCMoveTo *moving = [CCMoveTo actionWithDuration:0 position:ccp(40000,40000)];
    CCRepeatForever * repeatforever = [CCRepeatForever actionWithAction:rotation];
    [enemy3 runAction:repeatforever];
    
    [enemy3 runAction:[CCSequence actions:mov,sc,moving, nil]];
    [self addChild:enemy3];
    
    [enemythree addObject :enemy3];
    enemythreedelete = [[NSMutableArray alloc] init];
    for(CCSprite*bomb in enemythree){
         
        [enemythreedelete addObject:bomb];
                }
    }
    

-(void)lives{
        self.life =100;
    
    CCSprite *bar = [CCSprite spriteWithFile:@"Heath copy.png"];
    
    self.progressTimer = [CCProgressTimer progressWithFile:@"Heath.png"];
    self.progressTimer.type = kCCProgressTimerTypeHorizontalBarLR;
    [self.progressTimer setScale:1];
    self.progressTimer.percentage = 100;
    self.progressTimer.position = ccp(145,300);
    bar.position = progressTimer.position;
    [self addChild:self.progressTimer];
   // NSLog(@"%i",life);
    [self addChild:bar];
   


  
           
}

-(void)gameLoop:(ccTime)dt{
   
   for(CCSprite *enemies in enemy){
           //NSLog(@"%i", [proj count]);
    
    }
    for(CCSprite *enemies in enemydelete){
        [end setP:p];
        c++;
        p+=100;
        j++;
        uio++;
        }
   for(CCSprite*ene2 in enemytwodelete)
   {
       uio++;
       p+=100;
        [end setP:p];
   }
    for(CCSprite*ene3 in enemythreedelete)
    {
        uio++;
       
    }

    if(uio >= 20){
        
        if(gjk == 3){
            if([enemythree count]<1){
            [self enemy3];
            }
        }
    }

     
    if(c > 5){
        b = 3;
    }else if(c > 10){
        b = 4;
    }else if(c < 5){
        b = 2;
       
    }
    if(b > [enemy count]){
        [self enemy1];
       
       
    }
    if(j >= 12){
        //NSLog(@"Hi");
        if([enemytwo count] <  2){
            
            [self enemy2];
        }
        }

    
    
    
    [self update];
        for(CCSprite *projectile in proj){
        [self bulletMovement:projectile];
    
    
    }
    
}

-(void)powerups{
    CCSprite *heart = [CCSprite spriteWithFile:@"Heart.png"];
    

    int s = arc4random()%30;
    if(s == 8){
        for(CCSprite *enemies in enemydelete){
        heart.position =enemies.position;
                     [power addObject:heart];
            [self addChild:heart];
            //NSLog(@"%i",[power count]);
        
        }
        
    }
    
    if(s == 3){
        for(CCSprite *enemies in enemytwodelete){
            heart.position =enemies.position;
            [power addObject:heart];
            [self addChild:heart];
            //NSLog(@"%i",[power count]);
            
        }
  
        }
    
}
-(void)clear{
  clean = [CCSprite spriteWithFile:@"clear.png"];
  
    
   // int s = arc4random()%15;
    int s = arc4random()%20;
    if(s == 8){
        for(CCSprite *enemies in enemydelete){
           
            clean.position = enemies.position;
                       [clearer addObject:clean];

            [self addChild:clean];

            
        }
    }
    if(s == 6){
        for(CCSprite *enemies in enemytwodelete){
            clean.position =enemies.position;
            [clearer addObject:clean];
            [self addChild:clean];
           
            
        }
    }
}





-(void)update{
    
    deletehealth = [[NSMutableArray alloc] init];
    enemytwodelete  = [[NSMutableArray alloc]init];
    enemythreedelete2  = [[NSMutableArray alloc]init];

    NSMutableArray *playerdelete = [[NSMutableArray alloc] init];
    
  
    NSMutableArray * deleteclean = [[NSMutableArray alloc]init ];
    projectilesToDelete = [[NSMutableArray alloc] init];
    enemydelete  = [[NSMutableArray alloc]init];
         for(CCSprite *projectile in proj)
    {
      
        CGRect project = CGRectMake(projectile.position.x - (projectile.contentSize.width/2), 
                                    projectile.position.y - (projectile.contentSize.height/2), 
                                    projectile.contentSize.width, 
                                    projectile.contentSize.height);
        
        
        CGRect playerRect = CGRectMake(player.position.x - (player.contentSize.width/2), 
                                       player.position.y - (player.contentSize.height/2), 
                                       player.contentSize.width, 
                                       player.contentSize.height);
         
       
        
        if (CGRectIntersectsRect(playerRect, project)) {
            [projectilesToDelete addObject: projectile];
            emitter = [[CCParticleExplosion alloc] initWithTotalParticles:300];
            emitter.texture = [[CCTextureCache sharedTextureCache]addImage:@"particle.png"];
            emitter.position = ccp(projectile.position.x,projectile
                                   .position.y);
            [self addChild:emitter];
            // NSLog(@"%i",life);
            if(life > 0){
                //lifeholder = [[NSMutableArray alloc] init];
                life -= 5;
                
                [self.progressTimer setPercentage:life];
            }else{
                [playerdelete addObject:player];
                emitter.position = ccp(projectile.position.x,projectile
                                       .position.y);
                
                [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:3 scene:[end node]]];
            }
            

        }
                
        for(CCSprite*enemies in enemy){
            CGRect enemyRect = CGRectMake((enemies.position.x-5), 
                                          enemies.position.y-8.3, 
                                          7, 
                                          15);
            

                if(CGRectIntersectsRect(enemyRect, project)){
                    enemyex = [[CCParticleExplosion alloc] initWithTotalParticles:300];
                   enemyex.texture = [[CCTextureCache sharedTextureCache]addImage:@"particle.png"];
                   enemyex.position = ccp(enemies.position.x, enemies.position.y);
                   [self addChild:enemyex];
                    [enemydelete addObject:enemies];
            
                    [projectilesToDelete addObject:projectile];
                    [self powerups];
                    [self clear];
                   
              
                }
        }   
           
        for(CCSprite *enemies3 in enemythree){
            CGRect enemy3Rect = CGRectMake(enemies3 .position.x - (enemies3 .contentSize.width/2),
                                           enemies3 .position.y - (enemies3 .contentSize.height/2),
                                           enemies3 .contentSize.width,
                                           enemies3.contentSize.height);
            CGRect smalle = CGRectMake(enemies3.position.x,enemies3.position.y,1,1);
            
            if(CGRectIntersectsRect(enemy3Rect, project)){
                 p+=100;
                 [end setP:p];
                ene3h = [[CCParticleExplosion alloc] initWithTotalParticles:300];
                 ene3h.texture = [[CCTextureCache sharedTextureCache]addImage:@"particle.png"];
                 ene3h.position = ccp(enemies3.position.x, enemies3.position.y);
                [self addChild: ene3h];

                if([enemythreedelete2 containsObject:enemies3]== NO){
                    [enemythreedelete2 addObject:enemies3];
                    
                }
                for(CCSprite *esf in damagewave){
                    [deletewave addObject:esf];
                }
                [projectilesToDelete addObject:projectile];
                [self powerups];
                [self clear];
                
                     }
            
            if(CGRectIntersectsRect(smalle, erp)){
              
                for(CCSprite *enth in enemythree){
                    if([enemythree containsObject:enth]== YES){
                        
                        for(CCSprite* boom in enemythreedelete){
                            
                            ene3p = [[CCParticleExplosion alloc] initWithTotalParticles:300];
                            ene3p.texture = [[CCTextureCache sharedTextureCache]addImage:@"particle.png"];
                            ene3p.position = ccp(xj,yj);
                            [self addChild:ene3p];
                        }
                        
                        
                    }
                }
                
                
                
                for(CCSprite*bombdelete in enemythreedelete)
                {
                    
                    
                    damagewave =[[NSMutableArray alloc] init];
                    
                    [enemythree removeObject:bombdelete];
                    CCSprite *damagew =[CCSprite spriteWithFile:@"Wipe2.png"];
                    [self addChild:damagew];
                    [damagewave addObject:damagew];
                    if([damagewave containsObject:damagew]){
                        
                        for(CCSprite *dw in damagewave){
                            deletewave = [[ NSMutableArray alloc]init];
                            
                            dw.position = ccp(xj,yj);
                            
                            [dw runAction:[CCSequence actions:[CCScaleBy actionWithDuration:2 scale:1000],[CCMoveTo actionWithDuration:0 position:ccp(20000,20000)] ,nil]];
                            
                        }
                        
                    }
                    
                    [self removeChild:bombdelete cleanup:YES];
                    
                }
            }

        
              }
            
        
        for(CCSprite * enemies2 in enemytwo){
            
        CGRect enemy2Rect = CGRectMake(enemies2 .position.x - (enemies2 .contentSize.width/2),
                                       enemies2 .position.y - (enemies2 .contentSize.height/2),
                                       enemies2 .contentSize.width, 
                                       enemies2.contentSize.height);
            
            if(CGRectIntersectsRect(enemy2Rect, project)){
                if(isObjectMoving == YES){
               explode = [[CCParticleExplosion alloc] initWithTotalParticles:300];
                explode .texture = [[CCTextureCache sharedTextureCache]addImage:@"particle.png"];
                explode .position = ccp(enemies2.position.x, enemies2.position.y);
                [self addChild:explode ];
                
                [enemytwodelete addObject:enemies2];
                [projectilesToDelete addObject:projectile];
                [self powerups];
                [self clear];
                }
                
            }

        }
        
        for(CCSprite *health in power){
            
            CGRect heartRect = CGRectMake(health.position.x - (health.contentSize.width), 
                                          health.position.y - (health.contentSize.height), 
                                          health.contentSize.width, 
                                          health.contentSize.height);
            if(CGRectIntersectsRect(playerRect, heartRect)){
                life += 50;
                if (life > 100){
                    life = 100;
                    [self.progressTimer setPercentage:life];
                                  }
               
                [deletehealth addObject:health];
                
                
            }
        }

     
        
    
                for(CCSprite *boom in clearer){
            CGRect boomrect = CGRectMake(boom.position.x - (boom.contentSize.width/2), 
                                         boom.position.y - (boom.contentSize.height/2), 
                                         boom.contentSize.width, 
                                         boom.contentSize.height);
            if(CGRectIntersectsRect(boomrect, playerRect)){
                CCSprite *shock = [CCSprite spriteWithFile:@"Wipe.png"];
                [shockwave addObject:shock];
                [self addChild:shock];
                for(int xu = 0; xu < [proj count]; xu ++){
                 [projectilesToDelete addObject: projectile];
                }
                for(CCSprite *boomer in clearer){
                shock.position = boom.position;
                }
               CCScaleBy*scale = [CCScaleBy actionWithDuration:2 scale:1500];
               
                CCMoveTo *movie = [CCMoveTo actionWithDuration:0 position:ccp(20000,20000)];
                
                [shock runAction:[CCSequence actions:scale,movie, nil ]];
               
                
                
                for(CCSprite *shocky in shockwave){
                   
                    CGRect minibx = CGRectMake(shocky.position.x,shocky.position.y,1,1);
                         
                    if(CGRectIntersectsRect(minibx, deleterRect)){
                        [shockdele addObject:shocky];
                    }
                    
                           
                }
                

                [deleteclean addObject:boom];
                
                
            }
        }
        for(CCSprite *g in damagewave){
            
            CGRect minibx = CGRectMake(g.position.x,g.position.y,1,1);
            
            if(CGRectIntersectsRect(minibx, deleterRect)){
                [deletewave addObject:g];
                
            }
            
        }

        for(CCSprite *h in damagewave){
                           CGRect shockyrect = [h boundingBox];
            
                
                if(CGRectIntersectsRect(shockyrect, playerRect)){
                    for(int pio = 1; pio>0; pio--){
                    [projectilesToDelete addObject: projectile];
                    life -= 4;
                    [self.progressTimer setPercentage:life];
                    if (life <= 0){
                        [playerdelete addObject:player];
                        
//                        damage.position = ccp(projectile.position.x,projectile
//                                               .position.y);
                        
                        [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:3 scene:[end node]]];

                    }
                    
                        

                    damage = [[CCParticleExplosion alloc] initWithTotalParticles:300];
                    
                    damage.texture = [[CCTextureCache sharedTextureCache]addImage:@"particle2.png"];
                    damage.position = ccp(player.position.x,player
                                          .position.y);
                                       [self addChild:damage];
                        
                    
                }
            
            
            }
        }
               }
                   
    
    for (CCSprite *PTODEL in projectilesToDelete) {
        [proj removeObject:PTODEL];
        [self removeChild:PTODEL cleanup:YES];
    }
    for (CCSprite *play in playerdelete) {
        [self removeChild:play cleanup:YES];
    }
    for (CCSprite *ene in enemydelete) {
        
        [enemy removeObject:ene];
        [self removeChild:ene cleanup:YES];
    }
    for (CCSprite *ene in deletehealth) {
        
        [power removeObject:ene];
        [self removeChild:ene cleanup:YES];
    }
       for (CCSprite *ene2 in enemytwodelete) {
        
        [enemytwo removeObject:ene2];
        
        [self removeChild:ene2 cleanup:YES];
         }
    for (CCSprite *bom in deleteclean) {
        
        [clearer removeObject:bom];
        
        [self removeChild:bom cleanup:YES];
    }
    for(CCSprite *sprite in shockdele){
        [shockwave removeObject:sprite];
        [self removeChild:sprite cleanup:YES];
    }
    for(CCSprite *sprite in deletewave){
        [damagewave removeObject:sprite];
        [self removeChild:sprite cleanup:YES];
    }
    for(CCSprite *sprite in enemythreedelete2){
        [enemythree removeObject:sprite];
        [self removeChild:sprite cleanup:YES];
    }
}



-(void)projectileShooting:(ccTime)dt {
     [self schedule:@selector(projectileShooting:) interval:2.5];
    projcount++;
    if([proj count] <= 15 )
    if(enemy1.position.y < 320){
    v = ccp(player.position.x,player.position.y); 
    for(CCSprite *enemies in enemy){ 
        CCSprite * projectilebullet = [CCSprite spriteWithFile:@"Projectile.png"];
        [proj addObject:projectilebullet];
          [self addChild:projectilebullet];
            CGPoint MyVector = ccpSub(enemies.position,player.position );
            MyVector = ccpNormalize(MyVector);
            MyVector = ccpMult(MyVector, enemies.contentSize.width/2);
            MyVector = ccpMult(MyVector,-1);
            projectilebullet.position = ccpAdd(enemies.position, MyVector);
        
        for(CCSprite *projectile in proj){
            [self performSelector:@selector(deleteprojectile:) withObject:projectile afterDelay:10];
            
           
            
            
        }
    
    }
   
    }
    
    
    for(CCSprite *enem2 in enemytwo){
        if(  [proj count] <= 15){
            CCSprite * projectilebull = [CCSprite spriteWithFile:@"Projectile.png"];
            
            CGPoint MyVector = ccpSub(enem2.position,player.position );
            MyVector = ccpNormalize(MyVector);
            MyVector = ccpMult(MyVector, enem2.contentSize.width/2+10);
            MyVector = ccpMult(MyVector,-1);
            projectilebull.position = ccpAdd(enem2.position, MyVector);
            
            [self addChild:projectilebull];
            [proj addObject:projectilebull];
            
            for(CCSprite *projectile in proj){
                [self performSelector:@selector(deleteprojectile:) withObject:projectile afterDelay:14];
                
                
                
                
            }
            
        }
        
    }
    
        }

        
-(void)deleteprojectile:(CCSprite *)protime{
        

    NSMutableArray *timepro = [[NSMutableArray alloc]init];
    [timepro addObject:protime];
    
    

    for(CCSprite *objecttime in timepro){
      
       
        [proj removeObject:objecttime];
        [self removeChild:objecttime cleanup:YES];
        
        
    }
   

    
}




-(void)bulletMovement:(CCSprite *)bullet{
    
    CGPoint location = ccpSub(bullet.position, player.position);
    location = ccpNormalize(location);
    location = ccpMult(location, -1.5);
    bullet.position = ccpAdd(bullet.position, location);
       
   

    
    
}


-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView: [myTouch view]];
    location = [[CCDirector sharedDirector]convertToGL:location];
//    int realX = location.x;
//    //float ratio = (float) offY / (float) offX;
//    int realY = location.y;
//    int offRealX = realX - player.position.x;
//    int offRealY = realY - player.position.y;
//    float length = sqrtf((offRealX*offRealX)+(offRealY*offRealY));
//    float velocity = 150/1; // 480pixels/1sec
//    float realMoveDuration = length/velocity;
    
       [player runAction:[CCMoveTo actionWithDuration:1 position:location]];
   
    

}



- (void) dealloc
{

	[super dealloc];
}

@end
