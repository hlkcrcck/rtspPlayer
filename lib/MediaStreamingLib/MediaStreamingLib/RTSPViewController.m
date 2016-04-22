//
//  RTSPViewController.m
//  TellApp
//
//  Created by Li Viktor on 30/10/14.
//  Copyright (c) 2014 Drotpok. All rights reserved.
//
#import "RTSPViewController.h"
#import "RTSPPlayer.h"
#import "Utilities.h"

@interface RTSPViewController ()
@property (nonatomic, retain) NSTimer *nextFrameTimer;
@end

@implementation RTSPViewController

@synthesize imageView, playButton, video, stopButton, mediaURL;
@synthesize nextFrameTimer = _nextFrameTimer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {

	}
	
	return self;
}

- (void)setStreamUrl:(NSString*)url
{
	if (![[self mediaURL] isEqualToString:url] && self.mediaURL == nil) {
		video = [[RTSPPlayer alloc] initWithVideo:url usesTcp:YES];
	}
}

-(void)viewDidAppear:(BOOL)animated
{
	[self playStream];
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	//[imageView setContentMode:UIViewContentModeCenter];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void)playStream
{
	lastFrameTime = -1;
	
	// seek to 0.0 seconds
	[video seekTime:0.0];
	
	[_nextFrameTimer invalidate];
	self.nextFrameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/30
		target:self
		selector:@selector(displayNextFrame:)
		userInfo:nil
		repeats:YES];
}

-(void)stopStream
{
	if(self.nextFrameTimer) {
		[self.nextFrameTimer invalidate];
		self.nextFrameTimer = nil;
	}
}

-(IBAction)playButtonAction:(id)sender {
	[self playStream];
}

- (IBAction)stopButtonAction:(id)sender
{
	[self stopStream];
	[self dismissViewControllerAnimated:NO completion:^{}];
}

#define LERP(A,B,C) ((A)*(1.0-C)+(B)*C)

-(void)displayNextFrame:(NSTimer *)timer
{
	NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
	if (![video stepFrame]) {
		[timer invalidate];
		[playButton setEnabled:YES];
		[video closeAudio];
		return;
	}
	imageView.image = video.currentImage;
	float frameTime = 1.0/([NSDate timeIntervalSinceReferenceDate]-startTime);
	if (lastFrameTime<0) {
		lastFrameTime = frameTime;
	} else {
		lastFrameTime = LERP(frameTime, lastFrameTime, 0.8);
	}
}

@end
