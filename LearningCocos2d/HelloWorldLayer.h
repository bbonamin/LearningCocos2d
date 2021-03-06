//
//  HelloWorldLayer.h
//  LearningCocos2d
//
//  Created by Bruno Bonamin on 07/05/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "GameLayer.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCSprite *monkey;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@property (nonatomic, retain) CCSprite *monkey;
@end
