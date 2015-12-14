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
    NSUserDefaults *userData;
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
    
    userData = [NSUserDefaults standardUserDefaults];
}

- (NSArray<WordCategory *> *)categories {
    return categoryList;
}

- (WordCategory *)categoryAtIndex:(NSInteger)index {
    return categoryList[index];
}

- (WordCategory *)categoryByCategoryName:(NSString *)categoryName {
    for (WordCategory *category in categoryList) {
        if([categoryName isEqualToString:category.categoryName]) {
            return category;
        }
    }
    return nil;
}

- (int)loadScore:(NSString *)selectedCategory mode:(int)mode {
    NSString *keyName = [NSString stringWithFormat:@"%@%d", selectedCategory, mode];
    NSInteger score = [userData integerForKey:keyName];
    NSLog(@"%@ = %ld", keyName, score);
    return (int)score;
}

- (void)saveScore:(NSString *)selectedCategory mode:(int)mode score:(int)score {
    NSString *keyName = [NSString stringWithFormat:@"%@%d", selectedCategory, mode];
    [userData setInteger:score forKey:keyName];
}

- (NSArray *)loadScoreByMode:(int)mode {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(WordCategory *category in categoryList) {
        NSNumber *number = [NSNumber numberWithInt:[self loadScore:category.categoryName mode:mode]];
        [array addObject:number];
    }
    return array;
}

@end
