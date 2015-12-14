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
    CCSprite *star1;
    CCSprite *star2;
    CCSprite *star3;
    CCSprite *star4;
    CCSprite *star5;
    CCSprite *star6;
}

- (void)didLoadFromCCB {
    [self setupData];
    [self drawStar];
}

- (void)setupData {
    categoryList = [CategoryList sharedInstance];
}

- (void)modeButtonTapped {
    [SceneManager loadScene:@"Mode"];
}

- (void)animalButtonTapped {
    categoryList.selectedCategory = @"Animals";
    [SceneManager loadScene:@"Gameplay"];
}

- (void)fruitVegetableButtonTapped {
    categoryList.selectedCategory = @"Fruits";
    [SceneManager loadScene:@"Gameplay"];
}

- (void)drawStar {
    int score = [categoryList loadScore:@"Animals" mode:(int)categoryList.mode];
    switch (categoryList.mode) {
        case 1:
            if(score > 0 && score <= 200) {
                star1.visible = YES;
            }else if(score > 200 && score <= 400) {
                star1.visible = YES;
                star2.visible = YES;
            }else if(score > 400) {
                star1.visible = YES;
                star2.visible = YES;
                star3.visible = YES;
            }
            break;
        case 2:
            if(score > 0 && score <= 300) {
                star1.visible = YES;
            }else if(score > 300 && score <= 600) {
                star1.visible = YES;
                star2.visible = YES;
            }else if(score > 600) {
                star1.visible = YES;
                star2.visible = YES;
                star3.visible = YES;
            }
            break;
        case 3:
            if(score > 0 && score <= 400) {
                star1.visible = YES;
            }if(score > 400 && score <= 800) {
                star1.visible = YES;
                star2.visible = YES;
            }else if(score > 800) {
                star1.visible = YES;
                star2.visible = YES;
                star3.visible = YES;
            }
            break;
        default:
            break;
    }
    int score2 = [categoryList loadScore:@"Fruits" mode:(int)categoryList.mode];
    switch (categoryList.mode) {
        case 1:
            if(score2 > 0 && score2 <= 200) {
                star4.visible = YES;
            }else if(score2 > 200 && score2 <= 400) {
                star4.visible = YES;
                star5.visible = YES;
            }else if(score2 > 400) {
                star4.visible = YES;
                star5.visible = YES;
                star6.visible = YES;
            }
            break;
        case 2:
            if(score2 > 0 && score2 <= 300){
                star4.visible = YES;
            }else if(score2 > 300 && score2 <= 600) {
                star4.visible = YES;
                star5.visible = YES;
            }else if(score2 > 600) {
                star4.visible = YES;
                star5.visible = YES;
                star6.visible = YES;
            }
            break;
        case 3:
            if(score2 > 0 && score2 <= 400) {
                star4.visible = YES;
            }else if(score2 > 400 && score2 <= 800) {
                star4.visible = YES;
                star5.visible = YES;
            }else if(score2 > 800) {
                star4.visible = YES;
                star5.visible = YES;
                star6.visible = YES;
            }
            break;
        default:
            break;
    }
}

@end
