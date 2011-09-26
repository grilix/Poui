//
//  PouiAppDelegate.h
//  Poui
//
//  Created by Gonzalo Arreche on 2011-09-25.
//  Copyright 2011 Moove-iT. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PouiAppDelegate : NSObject <NSApplicationDelegate> {
  NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
