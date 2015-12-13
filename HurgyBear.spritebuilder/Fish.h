//
//  Fish.h
//  HurgyBear
//
//  Created by Nonpawit Teerachetmongkol on 12/12/2558 BE.
//  Copyright © 2558 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Fish : CCSprite

@property (nonatomic, copy)NSString *alphabet;
- (instancetype)initWithRandomAlphabet;
- (instancetype)initWithAlphabet:(NSString *)alphabet;
- (void)configureWithAlphabet:(NSString *)alpha;


@end
