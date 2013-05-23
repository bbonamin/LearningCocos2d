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
    
    CCSprite *background = [CCSprite spriteWithFile:@"background.jpg"];
    background.anchorPoint = ccp(0,0);
	[layer addChild:background z:-1 tag:100];
    
    [scene addChild: layer];
	
	return scene;
}

-(void) loadAddition: (id) item
{
  [[CCDirector sharedDirector] replaceScene:[CCTransitionJumpZoom transitionWithDuration:1.0 scene:[GameLayer scene]] ];
}
// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init])) {
        CGSize windowSize = [[CCDirector sharedDirector] winSize];
        isTouchEnabled_ = YES;
        
        CCMenuItemFont *menuItem1 = [CCMenuItemFont itemFromString:@"Play game" target:self selector:@selector(loadAddition:)];
        CCMenuItemFont *menuItem2 = [CCMenuItemFont itemFromString:@"Exit" target:self selector:@selector(loadAddition:)];
        CCMenu *menu = [CCMenu menuWithItems:menuItem1, menuItem2, nil];
        [menu alignItemsVerticallyWithPadding:5];
        
        [self addChild:menu];
        
        
	}
	return self;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
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
