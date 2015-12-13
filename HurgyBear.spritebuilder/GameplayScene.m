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
    CCSprite *wordImage;
    CCNode *hookDown;
    CCLabelTTF *timeLabel;
    CCLabelTTF *scoreLabel;
    CCLabelTTF *minusTimeLabel;
    CCLabelTTF *plusTimeLabel;
    NSMutableArray *blankSpaces;
    NSMutableArray *characterArray;
    int time;
}

- (void)didLoadFromCCB {
    [self setupConfig];
    [self setupData];
    [self startGame];
}

- (void)startGame {
    self.score = 0;
    time = START_TIMER;
    scoreLabel.string = @"0";
    [self schedule:@selector(gameTimer) interval:1];
    [self randomWord];
}

- (void)updateTime {
    timeLabel.string = [NSString stringWithFormat:@"%d", time];
}

- (void)gameTimer {
    time -= 1;
}

- (void)setupData {
    model = [[GameplayModel alloc] initWithScene:self];
    blankSpaces = [[NSMutableArray alloc] init];
    characterArray = [[NSMutableArray alloc] init];
}

- (void)setupConfig {
    self.userInteractionEnabled = YES;
    self.isPaused = NO;
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    if(self.isPaused) return;
    
    CGPoint touchLocation = [self convertToNodeSpace:[touch locationInNode:self]];
    [model processTouchLocation:touchLocation];
    
    [self touchForFishing:YES];

//    [self wordCheck];
}

- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    if (self.isPaused) return;
    [self touchForFishing:NO];
    
    //    [self minusTime];
}

- (void)plusTime {
    plusTimeLabel.visible = YES;
    id fade = [self runActionFade];
    [plusTimeLabel runAction:fade];
    time += 10;
}

- (void)minusTime {
    minusTimeLabel.visible = YES;
    id fade = [self runActionFade];
    [minusTimeLabel runAction:fade];
    time -= 5;
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
    [self clearArrayOfCharacter];
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

- (void)updateScore {
    scoreLabel.string = [NSString stringWithFormat:@"%d", self.score];
}

- (void)update:(CCTime)delta {
    if(time <= 0) {
        NSLog(@"Timeout!");
        [self gameOver];
    }
    [self updateScore];
    [self updateTime];
    
}

- (void)gameOver {
    [self unscheduleAllSelectors];
    NSLog(@"Game Over");
}

- (void)redrawWordImage {
    [self removeChild:wordImage];
    CCSprite *node = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"GameUI/Vocabulary/%@", model.currentWord.imagePath]];
    node.anchorPoint = wordImage.anchorPoint;
    node.position = wordImage.position;
    wordImage = node;
    [self addChild:wordImage];
}

- (void)drawBlankSpace:(int)length {
    const CGPoint POS = CGPointMake(80, 282.0);
    const CGFloat MARGIN = 25.0;
    [self clearBlankSpace];
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

- (void)drawArrayOfCharacter {
    [self clearArrayOfCharacter];
    const CGPoint POS = CGPointMake(105, 290.0);
    for(int i=0; i<model.arrayOfCharacter.count; i++){
        NSString *character = model.arrayOfCharacter[i];
        if([character isEqualToString:@"1"]) continue;
        CCLabelTTF *charLabel = [CCLabelTTF node];
        charLabel.anchorPoint = CGPointMake(0.5f, 0.5f);
        charLabel.position = ccp(POS.x + (25.0 * i), POS.y);
        charLabel.string = character;
        [self addChild:charLabel];
        [characterArray addObject:charLabel];
    }
}

- (void)clearArrayOfCharacter {
    for (CCNode *node in characterArray) {
        [self removeChild:node];
    }
    [characterArray removeAllObjects];
}

@end
