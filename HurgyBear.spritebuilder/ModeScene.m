//
//  ModeScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "ModeScene.h"
#import "SceneManager.h"
#import "CategoriesScene.h"
#import "CategoryList.h"

enum MODE{
    EASY = 1,
    NORMAL = 2,
    HARD = 3
};

@implementation ModeScene {
    CategoryList *categoryList;
}

- (void)didLoadFromCCB {
    categoryList = [CategoryList sharedInstance];
    CCLOG(@"hell mode scene");
}

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];
}

- (void)easyButtonTapped {
    [self selectMode:EASY];
}

- (void)normalButtonTapped {
    [self selectMode:NORMAL];
}

- (void)hardButtonTapped {
    [self selectMode:HARD];
}

- (void)selectMode:(NSInteger)mode {
    categoryList.mode = mode;
    [SceneManager loadScene:@"Categories"];
}

@end
