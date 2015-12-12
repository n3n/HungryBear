//
//  CategoryList.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordCategory.h"

@interface CategoryList : NSObject

@property (strong, readonly)NSArray<WordCategory *> *categories;
@property (readonly)NSUInteger count;
- (WordCategory *)categoryAtIndex:(NSInteger)index;

// Initialize Method
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
