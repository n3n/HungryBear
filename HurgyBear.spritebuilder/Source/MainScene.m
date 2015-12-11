
#import "MainScene.h"
#import "SceneManager.h"

@implementation MainScene

- (void)didLoadFromCCB {
//    [self playButtonTapped];
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
