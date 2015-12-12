//
//  ModeScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "ModeScene.h"
#import "SceneManager.h"
#import "CategoryList.h"

@implementation ModeScene {
    CategoryList *categoryList;
}

- (void)didLoadFromCCB {
    categoryList = [CategoryList sharedInstance];
}

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];
}

- (void)easyButtonTapped {
    [SceneManager loadScene:@"Categories"];
}

- (void)normalButtonTapped {
    [SceneManager loadScene:@"Categories"];
}

- (void)hardButtonTapped {
    [SceneManager loadScene:@"Categories"];
}

- (void)modeButtonTapped {
    
    CCLOG(@"MODE TAPPED!!!");
}

@end
