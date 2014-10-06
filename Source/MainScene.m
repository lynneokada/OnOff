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
    CCLabelTTF *_score;
    float _gameTime;
    float _onOffFrequency;
    int _points;
    NSArray *_ONorOFF;
}

- (id)init {
    if (self = [super init])
    {
        // activate touches on this scene
        self.userInteractionEnabled = TRUE;
        [[GameCenterManager sharedManager] setupManager];
        [[GameCenterManager sharedManager] setDelegate:self];
        _ONorOFF = @[@"ccbResources/On.wav",@"ccbResources/Off.wav"];
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
    
    int i = arc4random()%2;
    _onOffFrequency += delta;
    if (_onOffFrequency > 2) {
        [[OALSimpleAudio sharedInstance] playEffect:_ONorOFF[i]];
        _onOffFrequency = 0;
        if (_ONorOFF[0] && _lampOff.visible == NO) {
            _points++;
             _score.string = [NSString stringWithFormat:@"%d", (int)_points];
        } else if (_ONorOFF[1] && _lampOff.visible == YES) {
            _points++;
            _score.string = [NSString stringWithFormat:@"%d", (int)_points];
        }
        else {
            [self gameOver];
        }
    }
}

- (void)gameOver {
    [[OALSimpleAudio sharedInstance] playEffect:@"ccbResources/lightbulb break 2.mp3"];
    _lampOff.visible = YES;
}
@end
