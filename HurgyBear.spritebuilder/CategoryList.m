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
    NSArray<WordCategory *> *categoryList;
}

+ (instancetype)sharedInstance {
    static CategoryList *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CategoryList alloc] initWithDefaultData];
    });
    return sharedInstance;
}

- (instancetype)initWithDefaultData {
    self = [super init];
    if (self) {
        [self loadDefaultData];
    }
    return self;
}

- (void)loadDefaultData {
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"json"];
    NSData *dataJSON = [NSData dataWithContentsOfFile:filePath];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:dataJSON options:kNilOptions error:nil];
    
    NSMutableArray *tmpCategoryList = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in json) {
        WordCategory *category = [[WordCategory alloc] initWithDictionary:dict];
        [tmpCategoryList addObject:category];
    }
    
    categoryList = [[NSArray alloc] initWithArray:tmpCategoryList];
}

- (NSArray<WordCategory *> *)categories {
    return categoryList;
}

- (WordCategory *)categoryAtIndex:(NSInteger)index {
    return categoryList[index];
}

@end
