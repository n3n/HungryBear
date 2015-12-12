//
//  CategoriesScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "CategoriesScene.h"
#import "CategoryList.h"
#import "SceneManager.h"

@implementation CategoriesScene {
    CategoryList *categoryList;
}

- (void)didLoadFromCCB {
    [self setupData];
}

- (void)setupData {
    categoryList = [CategoryList sharedInstance];
}

- (void)modeButtonTapped {
    [SceneManager loadScene:@"Mode"];
}

- (void)animalButtonTapped {
    [SceneManager loadScene:@"Gameplay"];
}

- (void)fruitVegetableButtonTapped {
    [SceneManager loadScene:@"Gameplay"];
}

@end
