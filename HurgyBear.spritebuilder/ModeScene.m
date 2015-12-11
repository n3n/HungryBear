//
//  ModeScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "ModeScene.h"
#import "SceneManager.h"

@implementation ModeScene

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

@end
