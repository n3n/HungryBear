//
//  Word.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property (nonatomic, copy)NSString *vocabulary;
@property (nonatomic, copy)NSString *imagePath;
@property NSInteger playCount;
//@property (nonatomic, strong) *image;
//@property (readonly)BOOL ;

- (BOOL)isCorrect:(NSString *)otherWord;
- (NSArray *)randomArrayOfCharacterForWord:(NSInteger)length;

// Initialize method
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
