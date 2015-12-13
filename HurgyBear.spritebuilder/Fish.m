//
//  Fish.m
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "Fish.h"

@implementation Fish {
    CCLabelTTF *alphabetLabel;
}

- (instancetype)initWithRandomAlphabet {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithAlphabet:(NSString *)inAlphabet {
    self = [super init];
    if (self) {
        self.alphabet = inAlphabet;
        alphabetLabel.string = self.alphabet;
    }
    return self;
}

- (void)configureWithAlphabet:(NSString *)alpha{
    self.alphabet = alpha;
    alphabetLabel.string = self.alphabet.uppercaseString;
}

- (void)flipX:(BOOL)toggle {
    for (CCSprite *node in self.children) {
        node.flipX = toggle;
    }
}

- (void)flipY:(BOOL)toggle {
    for (CCSprite *node in self.children) {
        node.flipY = toggle;
    }
}
@end
