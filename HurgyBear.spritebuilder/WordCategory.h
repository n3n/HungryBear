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

@interface WordCategory : NSObject

@property (nonatomic, copy)NSString *categoryName;
@property (readonly, strong)NSArray<Word *> *words;
@property (nonatomic)BOOL isPlayed;

- (Word *)wordAtIndex:(NSInteger)index;
@property NSInteger stars;
@property NSInteger highScore;

// Initialize method
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
