//
//  WordList.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface WordList : NSObject

@property (strong, readonly)NSArray<Word *> *words;
- (Word *)wordAtIndex:(NSInteger *)index;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
