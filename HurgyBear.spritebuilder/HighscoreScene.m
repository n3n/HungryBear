//
//  HighscoreScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "HighscoreScene.h"
#import "SceneManager.h"

@implementation HighscoreScene

- (void)didLoadFromCCB {
    
}

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];
}



@end
