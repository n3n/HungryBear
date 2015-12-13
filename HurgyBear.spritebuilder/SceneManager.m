//
//  SceneManager.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "SceneManager.h"
#import "Scene.h"

@implementation SceneManager

+ (CCScene *)loadScene:(NSString *)sceneName {
    CCScene *gameScene = (CCScene *)[CCBReader loadAsScene:sceneName];
//    CCTransition *transition = [CCTransition transitionCrossFadeWithDuration:CCTransitionDirectionRight];
//    [[CCDirector sharedDirector] replaceScene:gameScene withTransition:transition];
    [[CCDirector sharedDirector] replaceScene:gameScene];
    return gameScene;
}

@end
