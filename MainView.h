//
//  MainView.h
//  Poui
//
//  Created by Gonzalo Arreche on 2011-09-25.
//  Copyright 2011 Moove-iT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Pow.h"

@interface MainView : NSView <NSTableViewDataSource> {
  IBOutlet NSTableView *appList;
  Pow *powObj;
}

@property(retain) NSTableView *appList;

-(IBAction)addApp:(id)sender;
-(IBAction)deleteApp:(id)sender;
-(IBAction)restartApp:(id)sender;
-(IBAction)reloadAppList:(id)sender;
-(NSString *)selectedApp;


@end
