#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>
#import "MediaStreamingLib/RTSPViewController.h"


@interface CDVrtspPlayer : CDVPlugin {

}
@property (nonatomic, retain) RTSPViewController* streamViewController;
@property (readwrite, assign) BOOL hasPendingOperation;
@property (nonatomic, weak) CDVInvokedUrlCommand* lastCommand;

- (void)playRTSP:(CDVInvokedUrlCommand*)command;

@end
