//
//  CategoryList.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "CategoryList.h"
#import "WordCategory.h"

@implementation CategoryList {
    NSArray<WordCategory *> *_categories;
}

+ (instancetype)sharedInstance {
    static CategoryList *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CategoryList alloc] init];
    });
    return sharedInstance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
