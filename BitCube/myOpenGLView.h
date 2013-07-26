//
//  myOpenGLView.h
//  BitCube
//
//  Created by 櫻井 稔 on 2013/07/26.
//  Copyright (c) 2013年 Minoru Sakurai. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface myOpenGLView : NSOpenGLView{
    NSWindow *fullscreenWindow;
    NSWindow *startingWindow;
    BOOL fullscreenOn;
}

@property (assign) IBOutlet NSWindow *startingWindow;

- (IBAction) toggleFullScreen:(id)sender;

@end
