//
//  GameplayModel.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/13/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "GameplayModel.h"
#import "GameplayScene.h"
#import "Fish.h"
#import "CategoryList.h"
#import "WordCategory.h"
#import "Word.h"

@implementation GameplayModel {
    NSMutableArray<Fish *> *objectList;
    NSMutableArray<Word *> *hasPlayedList;
    NSArray<Word *> *wordList;
    GameplayScene *gameplayScene;
    CategoryList *categoryList;
    int currentIndex;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

- (void)setupData {
    categoryList = [CategoryList sharedInstance];
    objectList = [[NSMutableArray alloc] init];
    currentIndex = 0;
    wordList = [[categoryList categoryByCategoryName:categoryList.selectedCategory] wordListByMode:categoryList.mode];
    
}

- (CCNode *)getNodeByTouchLocation:(CGPoint)touchLocation {
    CCNode *node = nil;
    for (CCNode *tmpNode in objectList) {
        if(CGRectContainsPoint(tmpNode.boundingBox, touchLocation)) {
            node = tmpNode;
            CCLOG(@"Overlap!");
            break;
        }
    }
    return node;
}

- (instancetype)initWithScene:(GameplayScene *)scene {
    self = [self init];
    if (self) {
        gameplayScene = scene;
    }
    return self;
}

- (void)createNewFish {
    
}

- (Word *)currentWord {
    return wordList[currentIndex];
}

- (void)skipWord {
    currentIndex = arc4random_uniform((u_int32_t)wordList.count);
    NSLog(@"Random number: %d", currentIndex);
}

@end