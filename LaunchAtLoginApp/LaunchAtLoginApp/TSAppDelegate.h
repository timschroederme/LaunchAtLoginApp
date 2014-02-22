//
//  TSAppDelegate.h
//  LaunchAtLoginApp
//
//  Created by Tim Schröder on 02.07.12.
//  Copyright (c) 2012-2014 Tim Schröder. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TSAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSSegmentedControl *launchAtLoginButton;

-(IBAction)toggleLaunchAtLogin:(id)sender;


@end
