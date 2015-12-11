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

@implementation GameplayScene {
    NSMutableSet<CCNode *> *objectList;
}

- (void)didLoadFromCCB {
    self.userInteractionEnabled = YES;
    [self setupData];
}

- (void)mainMenuButtonTapped {
//    [SceneManager loadScene:@"MainScene"];
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint touchLocation = [self convertToNodeSpace:[touch locationInNode:self]];
    CCNode *targetNode = [self getNodeByTouchLocation:touchLocation];
}

- (void)touchCancelled:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CCLOG(@"Cancelled");
}

- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CCLOG(@"Ended");
}

- (void)setupData {
    objectList = [[NSMutableSet alloc] init];
}

- (void)addChild:(CCNode *)node {
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
    CCLOG(@"Skipp ButtonTapped!!");
}

- (void)resetButtonTapped {
    CCLOG(@"Reset ButtonTapped!!");
}

- (void)deleteButtonTapped {
    CCLOG(@"Delete ButttonTapped!!");
}

- (void)soundButtonTapped {
    
    CCLOG(@"Sound ButtonTapped!!");
}

- (void)pauseButtonTapped {
    CCLOG(@"Pause ButtonTapped!!");
}



@end
