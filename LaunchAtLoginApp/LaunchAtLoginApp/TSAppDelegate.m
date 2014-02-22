//
//  TSAppDelegate.m
//  LaunchAtLoginApp
//
//  Created by Tim Schröder on 02.07.12.
//  Copyright (c) 2012-2014 Tim Schröder. All rights reserved.
//

#import "TSAppDelegate.h"
#import <ServiceManagement/ServiceManagement.h>

@implementation TSAppDelegate

#define helperAppBundleIdentifier @"com.timschroeder.LaunchAtLoginHelperApp"
#define terminateNotification @"TERMINATEHELPER"

@synthesize window = _window;

@synthesize launchAtLoginButton;


-(void)applicationDidFinishLaunching:(NSNotification *)notification
{
    // Check if main app was launched at login (by helper app)
    BOOL startedAtLogin = NO;
    
    // Check if helper app is running
    // If it is, main app was launched by helper app
    NSArray *apps = [[NSWorkspace sharedWorkspace] runningApplications];
    for (NSRunningApplication *app in apps) {
        if ([app.bundleIdentifier isEqualToString:helperAppBundleIdentifier]) startedAtLogin = YES;
    }
    
    if (startedAtLogin) {
        // Yes, main app was launched at login
        // Terminate helper app
        [[NSDistributedNotificationCenter defaultCenter] postNotificationName:terminateNotification
                                                                       object:[[NSBundle mainBundle] bundleIdentifier]];
        
        // Show Info
        NSAlert *alert = [NSAlert alertWithMessageText:@"App was launched at login." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
        [alert beginSheetModalForWindow:[NSApp mainWindow] modalDelegate:self didEndSelector:nil contextInfo:nil];
    }
}

-(IBAction)toggleLaunchAtLogin:(id)sender
{
    NSInteger clickedSegment = [sender selectedSegment];
    if (clickedSegment == 0) { // ON
        
        // Turn on launch at login
        if (!SMLoginItemSetEnabled ((__bridge CFStringRef)helperAppBundleIdentifier, YES)) {
            NSAlert *alert = [NSAlert alertWithMessageText:@"An error ocurred" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Couldn't add Helper App to launch at login item list."];
            [alert runModal];
        }

    }
    if (clickedSegment == 1) { // OFF
        
        // Turn off launch at login
        if (!SMLoginItemSetEnabled ((__bridge CFStringRef)helperAppBundleIdentifier, NO)) {
            NSAlert *alert = [NSAlert alertWithMessageText:@"An error ocurred" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Couldn't remove Helper App from launch at login item list."];
            [alert runModal];
        }
        
    }
}


@end
