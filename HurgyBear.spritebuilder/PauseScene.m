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
    self.positionType = CCPositionTypeNormalized;
    self.position = ccp(0.0, 0.0);
    self.zOrder = INT_MAX;
}

- (void)resumeButtonTapped {
    [self resumeGamePlayScene];
    [[OALSimpleAudio sharedInstance] playEffect:@"GameUI/Audios/pop-sound.m4a"];
    CCLOG(@"Resume ButtonTapped");
}

- (void)restartButtonTapped {
    [SceneManager loadScene:@"Gameplay"];
    [[OALSimpleAudio sharedInstance] playEffect:@"GameUI/Audios/pop-sound.m4a"];
    CCLOG(@"Restart ButtonTapped");
}

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];
    [[OALSimpleAudio sharedInstance] playEffect:@"GameUI/Audios/pop-sound.m4a"];
    CCLOG(@"Main Menu ButtonTapped");
    [OALSimpleAudio sharedInstance].effectsPaused = YES;
}

- (void)resumeGamePlayScene {
    for(CCNode *child in [self.originalScene children]) {
        child.paused = NO;
        child.userInteractionEnabled = YES;
    }
    self.originalScene.isPaused = NO;
    self.originalScene.paused = NO;
    [self.originalScene removeChild:self];
    [[OALSimpleAudio sharedInstance] playEffect:@"GameUI/Audios/pop-sound.m4a"];
}

- (void)configureWithDictionary:(GameplayScene *)originalScene {
    self.originalScene = originalScene;
}

@end
