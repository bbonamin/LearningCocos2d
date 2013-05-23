//
//  GameLayer.m
//  LearningCocos2d
//
//  Created by Bruno Bonamin on 22/05/13.
//
//

#import "GameLayer.h"

@implementation GameLayer

+(id) scene
{
    CCScene *scene = [CCScene node];
    GameLayer *layer = [GameLayer node];
    [scene addChild:layer];
    
    return scene;
}

-(id) init
{
    
    if( (self=[super init])) {
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Game Scene" fontName:@"Marker Felt" fontSize:30];
        label.position = ccp(320/2,480/2);
        [self addChild:label];
        
    }
    return self;
}

@end
