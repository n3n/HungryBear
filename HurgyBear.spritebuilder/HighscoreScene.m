//
//  HighscoreScene.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/11/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "HighscoreScene.h"
#import "SceneManager.h"
#import "CategoryList.h"
@implementation HighscoreScene {
    CCSprite *easyCard;
    CCSprite *normalCard;
    CCSprite *hardCard;
    CCLabelTTF *highScoreAnimalLabel;
    CCLabelTTF *highScoreFruitLabel;
    CategoryList *categoryList;
    CCSprite *starAnimal1;
    CCSprite *starAnimal2;
    CCSprite *starAnimal3;
    CCSprite *startFruit1;
    CCSprite *startFruit2;
    CCSprite *startFruit3;
}

- (void)didLoadFromCCB {
    categoryList = [CategoryList sharedInstance];
    [self easyTabTapped];
}

- (void)mainMenuButtonTapped {
    [SceneManager loadScene:@"MainScene"];

}

- (void)easyTabTapped {
    [self updateAnimalLabelByMode:1];
    [self updateFruitLabelByMode:1];
    easyCard.visible = YES;
    normalCard.visible = NO;
    hardCard.visible = NO;
    [self drawStar:1];
}

- (void)normalTabTapped {
    [self updateAnimalLabelByMode:2];
    [self updateFruitLabelByMode:2];
    [self drawStar:2];
    easyCard.visible = NO;
    normalCard.visible = YES;
    hardCard.visible = NO;
}

- (void)hardTabTapped {
    [self updateAnimalLabelByMode:3];
    [self updateFruitLabelByMode:3];
    [self drawStar:3];
    easyCard.visible = NO;
    normalCard.visible = NO;
    hardCard.visible = YES;
}

- (void)updateAnimalLabelByMode:(int)mode {
    highScoreAnimalLabel.string = [NSString stringWithFormat:@"%d", [categoryList loadScore:@"Animals" mode:mode]];
}

- (void)updateFruitLabelByMode:(int)mode {
    highScoreFruitLabel.string = [NSString stringWithFormat:@"%d", [categoryList loadScore:@"Fruits" mode:mode]];
}

- (void)drawStar:(int)mode {
    starAnimal1.visible = NO;
    starAnimal2.visible = NO;
    starAnimal3.visible = NO;
    startFruit1.visible = NO;
    startFruit2.visible = NO;
    startFruit3.visible = NO;
    int score = [categoryList loadScore:@"Animals" mode:mode];
    switch (mode) {
        case 1:
            if(score > 0 && score <= 200) {
                starAnimal1.visible = YES;
            }else if(score > 200 && score <= 400) {
                starAnimal1.visible = YES;
                starAnimal2.visible = YES;
            }else if(score > 400) {
                starAnimal1.visible = YES;
                starAnimal2.visible = YES;
                starAnimal3.visible = YES;
            }
            break;
        case 2:
            if(score > 0 && score <= 300) {
                starAnimal1.visible = YES;
            }else if(score > 300 && score <= 600) {
                starAnimal1.visible = YES;
                starAnimal2.visible = YES;
            }else if(score > 600) {
                starAnimal1.visible = YES;
                starAnimal2.visible = YES;
                starAnimal3.visible = YES;
            }
            break;
        case 3:
            if(score > 0 && score <= 400) {
                starAnimal1.visible = YES;
            }if(score > 400 && score <= 800) {
                starAnimal1.visible = YES;
                starAnimal2.visible = YES;
            }else if(score > 800) {
                starAnimal1.visible = YES;
                starAnimal2.visible = YES;
                starAnimal3.visible = YES;
            }
            break;
        default:
            break;
    }
    int score2 = [categoryList loadScore:@"Fruits" mode:mode];
    switch (mode) {
        case 1:
            if(score2 > 0 && score2 <= 200) {
                startFruit1.visible = YES;
            }else if(score2 > 200 && score2 <= 400) {
                startFruit1.visible = YES;
                startFruit2.visible = YES;
            }else if(score2 > 400) {
                startFruit1.visible = YES;
                startFruit2.visible = YES;
                startFruit3.visible = YES;
            }
            break;
        case 2:
            if(score2 > 0 && score2 <= 300){
                startFruit1.visible = YES;
            }else if(score2 > 300 && score2 <= 600) {
                startFruit1.visible = YES;
                startFruit2.visible = YES;
            }else if(score2 > 600) {
                startFruit1.visible = YES;
                startFruit2.visible = YES;
                startFruit3.visible = YES;
            }
            break;
        case 3:
            if(score2 > 0 && score2 <= 400) {
                startFruit1.visible = YES;
            }else if(score2 > 400 && score2 <= 800) {
                startFruit1.visible = YES;
                startFruit2.visible = YES;
            }else if(score2 > 800) {
                startFruit1.visible = YES;
                startFruit2.visible = YES;
                startFruit3.visible = YES;
            }
            break;
        default:
            break;
    }

}



@end
