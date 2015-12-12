
#import "MainScene.h"
#import "SceneManager.h"
#import "CategoryList.h"
#import "ModeScene.h"

@implementation MainScene

- (void)didLoadFromCCB {
    [CategoryList sharedInstance];
}
- (void)fishingButtonTapped {
    [SceneManager loadScene:@"Mode"];
}

- (void)howToPlayButtonTapped {
    [SceneManager loadScene:@"HowToPlay"];
}

- (void)highscoreButtonTapped {
    [SceneManager loadScene:@"Highscore"];
}
- (void)stampbookButtonTapped {
    [SceneManager loadScene:@"Stampbook"];
}

@end
