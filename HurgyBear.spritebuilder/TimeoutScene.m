//
//  TimeoutScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/14/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "TimeoutScene.h"
#import "SceneManager.h"
#import "CategoryList.h"

@implementation TimeoutScene {
    CCLabelTTF *scoreLabel;
    CCSprite *star1;
    CCSprite *star2;
    CCSprite *star3;
    CategoryList *categoryList;
}

- (void)didLoadFromCCB {
    categoryList = [CategoryList sharedInstance];
    star2.visible = NO;
    star3.visible = NO;
}

- (void)restartButtonTapped {
    [SceneManager loadScene:@"Gameplay"];
}

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];
}

- (void)score:(int)score {
    scoreLabel.string = [NSString stringWithFormat:@"%d", score];
    switch (categoryList.mode) {
        case 1:
            if(score > 200 && score <= 400) {
                star2.visible = YES;
            }else if(score > 400) {
                star2.visible = YES;
                star3.visible = YES;
            }
            break;
        case 2:
            if(score > 300 && score <= 600) {
                star2.visible = YES;
            }else if(score > 600) {
                star2.visible = YES;
                star3.visible = YES;
            }
            break;
        case 3:
            if(score > 400 && score <= 800) {
                star2.visible = YES;
            }else if(score > 800) {
                star2.visible = YES;
                star3.visible = YES;
            }
            break;
        default:
            break;
    }
    
    [categoryList saveScore:categoryList.selectedCategory mode:(int)categoryList.mode score:score];
    int loadScore = [categoryList loadScore:categoryList.selectedCategory mode:(int)categoryList.mode];
    NSLog(@"Load score: %d", loadScore);
}

@end
