//
//  TSAppDelegate.m
//  LaunchAtLoginApp
//
//  Created by Tim Schröder on 02.07.12.
//  Copyright (c) 2012 Tim Schröder. All rights reserved.
//

#import "TSAppDelegate.h"
#import <ServiceManagement/ServiceManagement.h>

@implementation TSAppDelegate

@synthesize window = _window;

@synthesize launchAtLoginButton;

-(IBAction)toggleLaunchAtLogin:(id)sender
{
    NSInteger clickedSegment = [sender selectedSegment];
    if (clickedSegment == 0) { // ON
        
        // Turn on launch at login
        if (!SMLoginItemSetEnabled ((__bridge CFStringRef)@"com.timschroeder.LaunchAtLoginHelperApp", YES)) {
            NSAlert *alert = [NSAlert alertWithMessageText:@"An error ocurred" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Couldn't add Helper App to launch at login item list."];
            [alert runModal];
        }

    }
    if (clickedSegment == 1) { // OFF
        
        // Turn off launch at login
        if (!SMLoginItemSetEnabled ((__bridge CFStringRef)@"com.timschroeder.LaunchAtLoginHelperApp", NO)) {
            NSAlert *alert = [NSAlert alertWithMessageText:@"An error ocurred" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Couldn't remove Helper App from launch at login item list."];
            [alert runModal];
        }
        
    }
}


@end
