//
//  myOpenGLView.m
//  BitCube
//
//  Created by 櫻井 稔 on 2013/07/26.
//  Copyright (c) 2013年 Minoru Sakurai. All rights reserved.
//

#import "myOpenGLView.h"

@implementation myOpenGLView

@synthesize startingWindow;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction) toggleFullScreen:(id)sender {
    if( fullscreenOn == true ) {
        [fullscreenWindow close];
        [startingWindow setAcceptsMouseMovedEvents:YES];
        [startingWindow setContentView: self];
        [startingWindow makeKeyAndOrderFront: self];
        [startingWindow makeFirstResponder: self];
        fullscreenOn = false;
    }
    else  {
        NSRect frame = [[NSScreen mainScreen] frame];
        // Instantiate new borderless window
        fullscreenWindow = [[NSWindow alloc]
                            initWithContentRect:frame
                            styleMask:NSBorderlessWindowMask
                            backing:NSBackingStoreBuffered
                            defer: NO];
        [startingWindow setAcceptsMouseMovedEvents:NO];
        if(fullscreenWindow != nil) {
            // Set the options for our new fullscreen window
            [fullscreenWindow setTitle: @"Full Screen"];
            [fullscreenWindow setReleasedWhenClosed: YES];
            [fullscreenWindow setAcceptsMouseMovedEvents:YES];
            [fullscreenWindow setContentView: self];
            [fullscreenWindow makeKeyAndOrderFront:self ];
            // By setting the window level to just beneath the screensaver,
            // only this window will be visible (no menu bar or dock)
            [fullscreenWindow setLevel: NSScreenSaverWindowLevel-1];
            [fullscreenWindow makeFirstResponder:self];
            fullscreenOn = true;
        } else {
            NSLog(@"Error: could not create fullscreen window!");
        }
    }
}

- (void)drawRect:(NSRect)dirtyRect
{
    NSLog(@"resize Window");
    NSRect bounds = [self bounds];
    float w = bounds.size.width;
    float h = bounds.size.height;
	glViewport(0, 0, w, h);
    glLoadIdentity();    
    glOrtho(-w / 200.0, w / 200.0, -h / 200.0, h / 200.0, -1.0, 1.0);
}

@end
