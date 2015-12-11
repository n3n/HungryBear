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

}

- (void)didLoadFromCCB {
    self.userInteractionEnabled = YES;
    [self setupYellowFish];
}

- (void)mainMenuButtonTapped {
//    [SceneManager loadScene:@"MainScene"];
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint touchLocation = [touch locationInNode:self];
    YellowFish *newSprite = (YellowFish *)[CCBReader load:@"YellowFish"];
    newSprite.position = touchLocation;
    [self addChild:newSprite];
}

- (void)touchCancelled:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    NSLog(@"");
}

- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    
}

- (void)setupYellowFish {
//    YellowFish *newSprite = (YellowFish *)[CCBReader load:@"YellowFish"];;
//    newSprite.position = CGPointMake(250, 100);
//    [self addChild:newSprite];
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
