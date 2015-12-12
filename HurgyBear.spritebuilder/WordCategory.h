//
//  WordCategory.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WordList;

@interface WordCategory : NSObject

@property (nonatomic, copy)NSString *categoryName;
@property (strong, readonly)NSArray<WordList *> *wordList;
@property (nonatomic, readonly)BOOL isPlay;
@property NSInteger highScore;

// Initialize method
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
