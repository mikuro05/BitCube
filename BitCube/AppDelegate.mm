//
//  AppDelegate.m
//  BitCube
//
//  Created by 櫻井 稔 on 2013/07/26.
//  Copyright (c) 2013年 Minoru Sakurai. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

-(void)awakeFromNib
{
    printf("awake");
    
	[[glView openGLContext] makeCurrentContext];
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	[NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(draw:) userInfo:nil repeats:YES];
    
    
}


-(void)draw:(id)sender
{
	[[glView openGLContext] makeCurrentContext];
	glClearColor(0, 0, 0, 1);
	glClear(GL_COLOR_BUFFER_BIT);
	glRotatef(5, 0, 1, 0);
	glColor4f(1, 1, 1, 1);
//	glutWireTeapot(0.5);
	glFinish();
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

@end
