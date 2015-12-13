
#import "MainScene.h"
#import "SceneManager.h"
#import "CategoryList.h"
#import "ModeScene.h"

@implementation MainScene {
    BOOL isPlayMusic;
    OALSimpleAudio *audio;
}

- (void)didLoadFromCCB {
    [CategoryList sharedInstance];
    audio = [OALSimpleAudio sharedInstance];
    if(!audio.bgPlaying) {
        [self playMusic];
    }else if(audio.bgPaused) {
        [audio playBg];
    }

}

- (void)playMusic {
    [audio playBg:@"GameUI/Audios/menu.m4a" loop:YES];
    audio.bgVolume = 0.1;
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
