//
//  Word.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "Word.h"

@implementation Word

- (BOOL)isCorrect:(NSString *)otherWord {
    return [self.vocabulary isEqualToString:otherWord];
}

- (NSArray *)suffleArrayOfCharacter {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.arrayOfCharacter];
    for (NSUInteger i = array.count; i > 1; i--) {
        [array exchangeObjectAtIndex:i - 1 withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
    return [[NSArray alloc] initWithArray:array];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {

    }
    return self;
}

- (NSArray *)arrayOfCharacter {
    NSMutableArray *chars = [[NSMutableArray alloc] init];
    for (int i=0; i<self.vocabulary.length; i++) {
        [chars addObject:[NSString stringWithFormat:@"%c", [self.vocabulary characterAtIndex:i]]];
    }
    return chars;
}

@end
