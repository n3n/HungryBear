//
//  GameplayScene.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Scene.h"

@interface GameplayScene : Scene
@property BOOL isPaused;
@property int score;

- (void)drawArrayOfCharacter;
- (void)clearArrayOfCharacter;
- (void)randomWord;

@end
