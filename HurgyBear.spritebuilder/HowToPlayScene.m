//
//  HowToPlayScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "HowToPlayScene.h"
#import "SceneManager.h"

@implementation HowToPlayScene

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];
}
@end
