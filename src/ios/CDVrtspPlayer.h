#import <Cordova/CDV.h>
#import <MediaStreamingLib/MediaStreamingLib/RTSPViewController.h>


@interface CDVrtspPlayer : CDVPlugin {

}
@property (nonatomic, retain) RTSPViewController *streamViewController;

@property (nonatomic, weak) UIViewController* viewController;

- (void)playRTSP:(CDVInvokedUrlCommand*)command;

@end
