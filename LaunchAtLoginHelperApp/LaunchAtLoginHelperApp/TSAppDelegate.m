//
//  TSAppDelegate.m
//  LaunchAtLoginHelperApp
//
//  Created by Tim Schröder on 02.07.12.
//  Copyright (c) 2012 Tim Schröder. All rights reserved.
//

#import "TSAppDelegate.h"

@implementation TSAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Check if main app is already running; if yes, do nothing and terminate helper app
    BOOL alreadyRunning = NO;
    NSArray *running = [[NSWorkspace sharedWorkspace] runningApplications];
    for (NSRunningApplication *app in running) {
        if ([[app bundleIdentifier] isEqualToString:@"com.timschroeder.LaunchAtLoginApp"]) {
            alreadyRunning = YES;
        }
    }
    
    if (!alreadyRunning) {
        
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSArray *p = [path pathComponents];
        NSMutableArray *pathComponents = [NSMutableArray arrayWithArray:p];
        [pathComponents removeLastObject];
        [pathComponents removeLastObject];
        [pathComponents removeLastObject];
        [pathComponents addObject:@"MacOS"];
        [pathComponents addObject:@"LaunchAtLoginApp"];
        NSString *newPath = [NSString pathWithComponents:pathComponents];
        [[NSWorkspace sharedWorkspace] launchApplication:newPath];
    }
    [NSApp terminate:nil];
}

@end
