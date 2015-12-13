//
//  GameplayScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "GameplayScene.h"
#import "GameplayModel.h"
#import "SceneManager.h"
#import "YellowFish.h"
#import "PauseScene.h"
#import "Word.h"

const static NSInteger START_TIMER = 180;

@implementation GameplayScene {
    GameplayModel *model;
    CCNode *hookRaise;
    CCNode *wordImage;
    CCNode *hookDown;
    CCLabelTTF *timeLabel;
    CCLabelTTF *scoreLabel;
    CCLabelTTF *minusTimeLabel;
    CCLabelTTF *plusTimeLabel;
    NSMutableArray *blankSpaces;
    int time;
}

- (void)didLoadFromCCB {
    [self setupConfig];
    [self setupData];
    [self startGame];
}

- (void)startGame {
    time = START_TIMER;
    timeLabel.string = [[NSString alloc] initWithFormat:@"%d", time];
    scoreLabel.string = @"0";
    [self schedule:@selector(gameTimer) interval:1];
    [self randomWord];
}

- (void)gameTimer {
    time -= 30;
    timeLabel.string = [NSString stringWithFormat:@"%d", time];
    NSLog(@"Time: %d", time);
    
    if(time <= 0) {
        NSLog(@"Timeout!");
        [self gameOver];
    }
}

- (void)setupData {
    model = [[GameplayModel alloc] initWithScene:self];
    blankSpaces = [[NSMutableArray alloc] init];
//    YellowFish *yellowFish = (YellowFish *)[CCBReader load:@"YellowFish"];
//    NSLog(@"%@",yellowFish.texture);
//        CGSize location = [[CCDirector sharedDirector] viewSize];
//        yellowFish.position = ccp(location.width/4, location.height/2);
//    
//        [self addChild:yellowFish];
//
    
//    CCSpriteFrameCache *frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
//    CCSpriteFrame *frame = [frameCache spriteFrameByName:@"FishBlueBig1.png"];
//    CCLOG(@"%@", frame);
    
}

- (void)setupConfig {
    self.userInteractionEnabled = YES;
    self.isPaused = NO;

    
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    if(self.isPaused) return;
    CCLOG(@"Touch Began");
    
    CGPoint touchLocation = [self convertToNodeSpace:[touch locationInNode:self]];
//    CCNode *targetNode = [self getNodeByTouchLocation:touchLocation];
    
    [self touchForFishing:YES];
    
    [self minusTime];

//    [self wordCheck];
    
}


- (void)plusTime {
    plusTimeLabel.visible = YES;
    id fade = [self runActionFade];
    [plusTimeLabel runAction:fade];
}

- (void)minusTime {
    minusTimeLabel.visible = YES;
    id fade = [self runActionFade];
    [minusTimeLabel runAction:fade];
}

- (id)runActionFade {
    id sequence = [CCActionSequence actionWithArray:
                   @[[CCActionFadeIn actionWithDuration:0],
                     [CCActionFadeOut actionWithDuration:1]
                     ]
                   ];
    return sequence;
    
}

- (void)move {
//        CGSize location = [[CCDirector sharedDirector] viewSize];
//        id move = [CCActionMoveTo actionWithDuration:2.4 position:CGPointMake(0, location.height/2)];
//        id actionSequence = [CCActionSequence actionWithArray:@[move, [move reverse]]];
//        [yellowFish runAction:[CCActionRepeatForever actionWithAction:actionSequence]];
}

- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    if (self.isPaused) return;
    [self touchForFishing:NO];
    
//    [self minusTime];
}

- (void)touchForFishing:(BOOL)toggle {
    hookDown.visible = !toggle;
    hookRaise.visible = toggle;
}

- (void)skipButtonTapped {
    if (self.isPaused) return;
    [self randomWord];
}

- (void)randomWord {
    [model skipWord];
    CCLOG(@"Skip is tapped. | Word: %@", model.currentWord.vocabulary);
    [self clearBlankSpace];
    [self drawBlankSpace:(int)model.currentWord.length];
    [self redrawWordImage];
}

- (void)soundButtonTapped {
    if (self.isPaused) return;
    CCLOG(@"Sound ButtonTapped!!");
}

- (void)pauseButtonTapped {
    if(self.isPaused) return;
    [self gamePause];
    CCLOG(@"Pause ButtonTapped!!");
}

- (void)gamePause {
    [self popupPasueScene];
    [self pauseGamePlayScene];
}

- (void)pauseGamePlayScene {
    self.paused = YES;
    self.isPaused = YES;
    for(CCNode *child in [self children]) {
        child.paused = YES;
        child.userInteractionEnabled = NO;
    }
}

- (void)popupPasueScene {
    PauseScene *pauseScene = (PauseScene *)[CCBReader load:@"Pause"];
    [pauseScene configureWithDictionary:self];
    [self addChild:pauseScene];
}

- (void)update:(CCTime)delta {
    
}

- (void)gameOver {
    [self unscheduleAllSelectors];
    NSLog(@"Game Over");
}

- (void)redrawWordImage {
    const CGPoint POS = CGPointMake(50.0, 302.0);
    NSString *imagePath = [NSString stringWithFormat:@"GameUI/Animal/%@", model.currentWord.imagePath];
    CCSprite *node = [CCSprite spriteWithImageNamed:imagePath];
    node.anchorPoint = CGPointMake(0.5f, 0.5f);
    node.position = ccp(POS.x , POS.y);
    [blankSpaces addObject:node];
    [self addChild:node];
}

- (void)drawBlankSpace:(int)length {
    const CGPoint POS = CGPointMake(80, 282.0);
    const CGFloat MARGIN = 25.0;
    for(int i=1; i<=length; i++) {
        CCSprite *node = [CCSprite spriteWithImageNamed:@"GameUI/Fishing/PlayGame/Assets/PlayGame_Blank.png"];
        node.anchorPoint = CGPointMake(0.5f, 0.5f);
        node.position = ccp(POS.x + (MARGIN * i) , POS.y);
        [blankSpaces addObject:node];
        [self addChild:node];
    }
}

- (void)clearBlankSpace {
    for (CCSprite *node in blankSpaces) {
        [self removeChild:node];
    }
    blankSpaces = [[NSMutableArray alloc] init];
}

@end
