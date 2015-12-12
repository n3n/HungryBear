//
//  PauseScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "PauseScene.h"
#import "GameplayScene.h"
#import "SceneManager.h"

@implementation PauseScene

- (void)didLoadFromCCB {
    
}

- (void)resumeButtonTapped {
    [self resumeGamePlayScene];
    CCLOG(@"Resume ButtonTapped");
}

- (void)restartButtonTapped {
    [SceneManager loadScene:@"Gameplay"];
    CCLOG(@"Restart ButtonTapped");
}

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];
    CCLOG(@"Main Menu ButtonTapped");
}

- (void)resumeGamePlayScene {
    for(CCNode *child in [self.originalScene children]) {
        child.paused = NO;
        child.userInteractionEnabled = YES;
    }
    self.originalScene.isPaused = NO;
    [self.originalScene removeChild:self];

}

@end
