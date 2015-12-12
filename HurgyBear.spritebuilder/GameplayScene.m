//
//  GameplayScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "GameplayScene.h"
#import "SceneManager.h"
#import "YellowFish.h"
#import "PauseScene.h"

@implementation GameplayScene {
    NSMutableSet<CCNode *> *objectList;
    CCSprite *yellowFish;
    CCNode *hookRaise;
    CCNode *hookDown;
    CCLabelTTF *timeLabel;
    CCLabelTTF *scoreLabel;
    CCLabelTTF *minusTimeLabel;
    CCLabelTTF *plusTimeLabel;
}

- (void)didLoadFromCCB {
    self.userInteractionEnabled = YES;
    self.isPaused = NO;
    [self setupData];
}

- (void)mainMenuButtonTapped {
//    [SceneManager loadScene:@"MainScene"];
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    if(self.isPaused) return;
    CCLOG(@"Touch Began");
    
    CGPoint touchLocation = [self convertToNodeSpace:[touch locationInNode:self]];
    CCNode *targetNode = [self getNodeByTouchLocation:touchLocation];
    
    [self touchForFishing:YES];
    
//    CGSize location = [[CCDirector sharedDirector] viewSize];
//    id move = [CCActionMoveTo actionWithDuration:2.4 position:CGPointMake(0, location.height/2)];
//    id actionSequence = [CCActionSequence actionWithArray:@[move, [move reverse]]];
//    [yellowFish runAction:[CCActionRepeatForever actionWithAction:actionSequence]];
    
}

- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    if (self.isPaused) return;
    [self touchForFishing:NO];
}

- (void)touchForFishing:(BOOL)toggle {
    hookDown.visible = !toggle;
    hookRaise.visible = toggle;
}

- (void)setupData {
    objectList = [[NSMutableSet alloc] init];
    self.isPaused = NO;
    
    yellowFish = [CCBReader load:@"YellowFish"];
    CGSize location = [[CCDirector sharedDirector] viewSize];
    
    yellowFish.position = ccp(location.width/4, location.height/2);
    [self addChild:yellowFish];
    
}

- (void)addGameObject:(CCNode *)node {
    [super addChild:node];
    [objectList addObject:node];
}

- (CCNode *)getNodeByTouchLocation:(CGPoint)touchLocation {
    CCNode *node = nil;
    for (CCNode *tmpNode in objectList) {
        NSLog(@"(%.2f, %.2f) | (%.2f, %.2f)", touchLocation.x, touchLocation.y, tmpNode.position.x, tmpNode.position.y);
        if(CGRectContainsPoint(tmpNode.boundingBox, touchLocation)) {
            node = tmpNode;
            CCLOG(@"Overlap!");
            break;
        }
    }
    return node;
}
- (void)skipButtonTapped {
    if (self.isPaused) return;
    CCLOG(@"Skipp ButtonTapped!!");
}

- (void)soundButtonTapped {
    if (self.isPaused) return;
    CCLOG(@"Sound ButtonTapped!!");
}

- (void)pauseButtonTapped {
    
    if (!self.isPaused) {

        [self popupPasueScene];
        [self pauseGamePlayScene];

        
        CCLOG(@"Pause ButtonTapped!!");
        self.isPaused = YES;
    }
}

-(void)pauseGamePlayScene {
    for(CCNode *child in [self children]) {
        child.paused = YES;
        child.userInteractionEnabled = NO;
    }

}
- (void)popupPasueScene {
    PauseScene *pauseScene = (PauseScene *)[CCBReader load:@"Pause"];
    pauseScene.originalScene = self;
    pauseScene.positionType = CCPositionTypeNormalized;
    pauseScene.position = ccp(0.0, 0.0);
    pauseScene.zOrder = INT_MAX;
    [self addChild:pauseScene];
}




@end
