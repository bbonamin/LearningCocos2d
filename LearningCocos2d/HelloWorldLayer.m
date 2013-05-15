//
//  HelloWorldLayer.m
//  LearningCocos2d
//
//  Created by Bruno Bonamin on 07/05/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize monkey;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
    
	[scene addChild: layer];
	
	return scene;
}

- (void) animation_finished
{
    int x = arc4random() % 320;
    int y = arc4random() % 480;
    
    id moveTo = [CCMoveTo actionWithDuration:2.0 position:ccp(x,y)];
    id callback = [CCCallFunc actionWithTarget:self selector:@selector(animation_finished)];
    id ease = [CCEaseBounceInOut actionWithAction:moveTo];
    
    [self.monkey runAction:[CCSequence actions: ease, callback, nil]];

}
// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init])) {
        isTouchEnabled_ = YES;
        self.monkey = [CCSprite spriteWithFile:@"yoshiisland.gif"];
        
        int x = arc4random() % 320;
        int y = arc4random() % 480;
        
        id moveTo = [CCMoveTo actionWithDuration:2.0 position:ccp(x,y)];
        id callback = [CCCallFunc actionWithTarget:self selector:@selector(animation_finished)];
        id ease = [CCEaseBounceInOut actionWithAction:moveTo];
        [self.monkey runAction:[CCSequence actions: ease, callback, nil]];
        [self addChild:self.monkey];
        
//        CGSize windowSize = [[CCDirector sharedDirector] winSize];
//        CCSprite *monkey = [CCSprite spriteWithFile:@"yoshiisland.gif"];
//        monkey.position = ccp(windowSize.width/2,windowSize.height/2);
//        
//        id moveTo = [CCMoveTo actionWithDuration:0.9 position:ccp(100,100)];
//        id rotateBy = [CCRotateBy actionWithDuration:0.9 angle:360];
//        id callback = [CCCallFunc actionWithTarget:self selector:@selector(animation_finished)];
//        
//        [monkey runAction:[CCSequence actions:moveTo, rotateBy, callback, nil]];
//        [monkey runAction: [CCMoveTo actionWithDuration:0.9 position:ccp(200,200)]];
//        [monkey runAction: [CCRotateBy actionWithDuration: 0.9 angle:360]];
//        
//        
//        [self addChild:monkey];
        
        
        
	}
	return self;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    float distance = powf(self.monkey.position.x - location.x, 2) + powf(self.monkey.position.y - location.y, 2);
    
    distance = sqrtf(distance);
    
    if(distance <= 25)
    {
        id ease = [CCEaseElasticInOut actionWithAction:[CCRotateBy actionWithDuration:5.0 angle:360] period:0.4];
        [self.monkey runAction:ease];
    }
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
