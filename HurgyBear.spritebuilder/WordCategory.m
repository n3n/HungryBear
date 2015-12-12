//
//  WordCategory.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "WordCategory.h"
#import "Word.h"
@implementation WordCategory {
    NSArray<Word *> *wordList;
}

- (void)setupData {
    self.isPlayed = NO;
    wordList = [[NSArray alloc] init];
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
        
    }
    return self;
}

- (NSArray<Word *> *)words {
    return wordList;
}

- (Word *)wordAtIndex:(NSInteger)index {
    return wordList[index];
}
@end
