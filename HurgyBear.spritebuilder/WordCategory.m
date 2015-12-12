//
//  WordCategory.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "WordCategory.h"
#import "Word.h"

const NSString *kIsLocked = @"isLocked";
const NSString *kCategoryName = @"categoryName";
const NSString *kWordList = @"wordList";

@implementation WordCategory {
    NSArray<Word *> *words;
}

- (void)setupData {
    words = [[NSArray alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        self.categoryName = dictionary[kCategoryName];
        self.isLocked = dictionary[kIsLocked];
        words = [self parserWordList:dictionary[kWordList]];
    }
    return self;
}

- (NSArray *)parserWordList:(NSArray *)array {
    NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array) {
        [tmpArray addObject:[[Word alloc] initWithDictionary:dict]];
    }
    return [[NSArray alloc] initWithArray:tmpArray];
}

- (NSArray<Word *> *)wordList {
    return words;
}

- (Word *)wordAtIndex:(NSInteger)index {
    return words[index];
}
@end
