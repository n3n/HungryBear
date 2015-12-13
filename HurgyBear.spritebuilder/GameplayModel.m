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
    NSMutableArray *arrayOfCharacter;
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
            break;
        }
    }
    return node;
}

- (void)processTouchLocation:(CGPoint)touchLocation {
    
    Fish *node = (Fish *)[self getNodeByTouchLocation:touchLocation];
    
    if(!node) return;
    if(![self hasAlphabet:node.alphabet]) return;
    if([self alphabetIsOver:node.alphabet]) return;
    
    CCLOG(@"Touch fished : [%@]", node.alphabet);
    
    NSString *alpha = [[NSString alloc] initWithString:node.alphabet];
    int index = [self getLastestIndex:alpha];
    arrayOfCharacter[index] = alpha.uppercaseString;

    id sequence = [CCActionFadeIn actionWithDuration:1];
    
    [node runAction:sequence];
    
    
    [gameplayScene removeChild:node];
    [objectList removeObject:node];
    
    gameplayScene.score += 25;
    
    NSString * result = [[arrayOfCharacter valueForKey:@"description"] componentsJoinedByString:@""];
    NSLog(@"%@ == %@", result, self.currentWord.vocabulary);
    if([self.currentWord isCorrect:result]) {
        [gameplayScene randomWord];
    }
    [gameplayScene drawArrayOfCharacter];
    node = nil;
}

- (int)getLastestIndex:(NSString *)alpha {
    int index = -1;
    for(int i=0; i<self.currentWord.vocabulary.length; i++) {
        if( [self.currentWord.vocabulary characterAtIndex:i] == [alpha characterAtIndex:0] ) {
            NSString *character = [arrayOfCharacter objectAtIndex:i];
                
            if([character.lowercaseString isEqualToString:alpha.lowercaseString]) continue;
            
            index = i;
            break;
        }
    }
    return index;
}

- (BOOL)alphabetIsOver:(NSString *)alpha {
    return [self countAlphabetOfArray:arrayOfCharacter alphabet:alpha] == [self countAlphabetOfString:self.currentWord.vocabulary alphabet:alpha];
}

- (NSInteger)countAlphabetOfString:(NSString *)string alphabet:(NSString *)alpha {
    NSInteger count = 0;
    for (int i=0; i<string.length; i++) {
        if([string.lowercaseString characterAtIndex:i] == [alpha.lowercaseString characterAtIndex:0]) {
            count++;
        }
    }
    return count;
}

- (NSInteger)countAlphabetOfArray:(NSArray *)array alphabet:(NSString *)alpha {
    NSInteger count = 0;
    for (int i=0; i<array.count; i++) {
        NSString *alphaInArray = (NSString *)array[i];
        if([alphaInArray.lowercaseString isEqualToString:alpha.lowercaseString]) {
            count++;
        }
    }
    return count;
}

- (instancetype)initWithScene:(GameplayScene *)scene {
    self = [self init];
    if (self) {
        gameplayScene = scene;
    }
    return self;
}

- (CGPoint)randomPosition {
    int x = arc4random() % 500;
    int y = 45 + arc4random() % 190;
    return CGPointMake(x, y);
}

- (void)createNewFish:(NSString *)character {
    Fish *fish = (Fish *)[CCBReader load:@"YellowFish"];
    [fish configureWithAlphabet:character];
    fish.position = [self randomPosition];
    [objectList addObject:fish];
    [gameplayScene addChild:fish];
    
}

- (void)clearFishes {
    for (Fish *fish in objectList) {
        [gameplayScene removeChild:fish];
    }
    [objectList removeAllObjects];
}

- (Word *)currentWord {
    return wordList[currentIndex];
}

- (BOOL)hasAlphabet:(NSString *)alpha {
    return [self.currentWord.vocabulary.lowercaseString containsString:alpha.lowercaseString];
}

- (void)skipWord {
    [self clearFishes];
    currentIndex = arc4random_uniform((u_int32_t)wordList.count);
    arrayOfCharacter = [[NSMutableArray alloc] init];
    for(int i=0; i<self.currentWord.length; i++) [arrayOfCharacter addObject:@"1"];
    
    for (NSString *character in self.currentWord.arrayOfCharacter) {
        [self createNewFish:character];
    }
}

- (NSArray *)arrayOfCharacter {
    return arrayOfCharacter;
}

@end