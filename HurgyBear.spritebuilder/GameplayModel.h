//
//  GameplayModel.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/13/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Word;

@interface GameplayModel : NSObject

@property (readonly)Word *currentWord;
@property (readonly)NSArray *arrayOfCharacter;

- (CCNode *)getNodeByTouchLocation:(CGPoint)touchLocation;
- (void)processTouchLocation:(CGPoint)touchLocation;
- (instancetype)initWithScene:(CCScene *)scene;
- (void)skipWord;

@end
