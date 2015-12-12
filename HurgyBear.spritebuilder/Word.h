//
//  Word.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSString *kVocabulary;
extern const NSString *kImagePath;
extern const NSString *kIsLocked;
extern const NSString *kFailed;

@interface Word : NSObject

@property (nonatomic, copy)NSString *vocabulary;
@property (nonatomic, copy)NSString *imagePath;
@property (nonatomic, readonly)NSArray *arrayOfCharacter;
@property NSInteger failedCount;
@property BOOL isLocked;
//@property (nonatomic, strong) *image;
//@property (readonly)BOOL ;

- (BOOL)isCorrect:(NSString *)otherWord;
- (NSArray *)suffleArrayOfCharacter;

// Initialize method
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end