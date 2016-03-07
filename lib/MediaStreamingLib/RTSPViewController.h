//
//  RTSPViewController.h
//  TellApp
//
//  Created by Li Viktor on 30/10/14.
//  Copyright (c) 2014 Drotpok. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RTSPPlayer;

@interface RTSPViewController : UIViewController
{
	RTSPPlayer *video;
	IBOutlet UIImageView *imageView;
	NSString *mediaURL;
	float lastFrameTime;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
@property (nonatomic, retain) RTSPPlayer *video;
@property (nonatomic, retain) NSString *mediaURL;

- (IBAction)playButtonAction:(id)sender;
- (IBAction)stopButtonAction:(id)sender;
- (void)setStreamUrl:(NSString*)url;

@end
