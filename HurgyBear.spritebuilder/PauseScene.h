//
//  PauseScene.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "CCNode.h"
@class GameplayScene;

@interface PauseScene : CCNode
@property (nonatomic, strong) GameplayScene *originalScene;
- (void)configureWithDictionary:(GameplayScene *)originalScene;
@end
