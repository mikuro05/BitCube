//
//  AppDelegate.h
//  BitCube
//
//  Created by 櫻井 稔 on 2013/07/26.
//  Copyright (c) 2013年 Minoru Sakurai. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "myOpenGLView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    IBOutlet myOpenGLView       *glView;
}

@property (assign) IBOutlet NSWindow *window;

@end
