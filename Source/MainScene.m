//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene {
    CCNodeColor *_lampOff;
    CCLabelTTF *_onoffLabel;
    float _gameTime;
}

- (id)init {
    if (self = [super init])
    {
        // activate touches on this scene
        self.userInteractionEnabled = TRUE;
        [[GameCenterManager sharedManager] setupManager];
        [[GameCenterManager sharedManager] setDelegate:self];
        
        //[[GameCenterManager sharedManager] saveAndReportScore:1000 leaderboard:@"Leaderboard ID"  sortOrder:GameCenterSortOrder];
        
    }
    return self;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [[OALSimpleAudio sharedInstance] playEffect:@"ccbResources/switch-1.mp3"];
    if (_lampOff.visible == NO) {
        _lampOff.visible = YES;
    } else if (_lampOff.visible == YES) {
        _lampOff.visible = NO;
    }
}

- (void)update:(CCTime)delta {
    _gameTime += delta;
    if (_gameTime > 4) {
        [_onoffLabel removeFromParent];
    }
    
}
@end
