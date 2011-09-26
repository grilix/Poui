//
//  MainView.m
//  Poui
//
//  Created by Gonzalo Arreche on 2011-09-25.
//  Copyright 2011 Moove-iT. All rights reserved.
//

#import "MainView.h"
#import "Pow.h"

@implementation MainView

@synthesize appList;

-(void)addApp:(id)sender {
  NSOpenPanel * panel = [NSOpenPanel openPanel];

  [panel setCanChooseDirectories: YES];
  [panel setCanChooseFiles: NO];

  [panel  beginWithCompletionHandler: ^(NSInteger result) {
     if (result == NSFileHandlingPanelOKButton) {
       [powObj addApp: [[panel URL] path]];
       [appList reloadData];
     }
   }];
}

-(void)restartApp:(id)sender {
  [powObj restartApp: [self selectedApp]];
}

-(void)deleteApp:(id)sender {
  [powObj deleteApp: [self selectedApp]];
}

-(void)reloadAppList:(id)sender {
  [powObj reloadAppList];
}

-(void)awakeFromNib {
  powObj = [[Pow alloc] init];
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
  return [[powObj appList] count];
}

-(id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
           row:(NSInteger)row {
  
  NSArray *list = [powObj appList];
  
  if ([[tableColumn identifier] isEqualToString: @"name"]) {
    return [list objectAtIndex: row];
  } else if ([[tableColumn identifier] isEqualToString: @"path"]) {
    return [powObj pathForApp: [list objectAtIndex: row]];
  }
  return @"";
}

-(NSString *)selectedApp {
  return [[powObj appList] objectAtIndex: [appList selectedRow]];
}

-(void)dealloc {
  [powObj release];
}

@end
