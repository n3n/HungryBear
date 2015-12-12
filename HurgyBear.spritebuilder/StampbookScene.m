//
//  StampbookScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "StampbookScene.h"
#import "SceneManager.h"

@implementation StampbookScene

- (void)didLoadFromCCB {
    
}

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];
}
@end
