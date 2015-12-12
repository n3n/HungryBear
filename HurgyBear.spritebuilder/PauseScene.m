//
//  PauseScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "PauseScene.h"
#import "GameplayScene.h"

@implementation PauseScene

- (void)resumeButtonTapped {
    [self resumeGamePlayScene];

    CCLOG(@"Resume ButtonTapped");
}

- (void)restartButtonTapped {
    CCLOG(@"Restart ButtonTapped");
}

- (void)mainMenuButtonTapped {
    CCLOG(@"Main Menu ButtonTapped");
}

- (void)resumeGamePlayScene {
    for(CCNode *child in [self.originalScene children]) {
        child.paused = NO;
    }
    self.originalScene.isPaused = NO;
    [self.originalScene removeChild:self];
}

@end
