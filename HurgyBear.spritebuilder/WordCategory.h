//
//  WordCategory.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WordList;
@class Word;

extern const NSString *kCategoryName;
extern const NSString *kIsLocked;
extern const NSString *kWordList;

@interface WordCategory : NSObject

@property (nonatomic, copy)NSString *categoryName;
@property (readonly, strong)NSArray<Word *> *wordList;
@property (nonatomic)BOOL isLocked;

- (NSArray *)wordListByMode:(NSInteger)mode;
- (Word *)wordAtIndex:(NSInteger)index;
@property NSInteger stars;
@property NSInteger highScore;

// Initialize method
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end