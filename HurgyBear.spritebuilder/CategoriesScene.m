//
//  CategoriesScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "CategoriesScene.h"
#import "SceneManager.h"

@implementation CategoriesScene

- (void)modeButtonTapped {
    [SceneManager loadScene:@"Mode"];
}

- (void)animalButtonTapped {
    [SceneManager loadScene:@"Gameplay"];
}


@end