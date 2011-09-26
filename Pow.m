//
//  Pow.m
//  Poui
//
//  Created by Gonzalo Arreche on 2011-09-25.
//  Copyright 2011 Moove-iT. All rights reserved.
//

#import "Pow.h"

@implementation Pow

- (id)init {
    self = [super init];
    if (self) {
      [self reloadAppList];
      //list = [[NSArray arrayWithObjects: nil] retain];
    }
    
    return self;
}

-(NSArray *)appList {
  return list;
}

-(void)reloadAppList {
  NSFileManager *filemgr;
  
  filemgr = [NSFileManager defaultManager];
  [list release];
  list = [[filemgr contentsOfDirectoryAtPath: [NSHomeDirectory() stringByAppendingString: @"/.pow"]
                                      error: nil] retain];
}

-(NSString *)nameForApp: (NSString *)path {
  return [path lastPathComponent];
}

-(void)addApp:(NSString *)path
     withName:(NSString *)name {
  NSFileManager *filemgr;
  
  filemgr = [NSFileManager defaultManager];

  if ([filemgr createSymbolicLinkAtPath: [self installationPathForApp: name]
                    withDestinationPath: path
                                  error: NULL]  == YES) {
    NSLog(@"Add successful");
    [self reloadAppList];
  } else {
    NSLog(@"Add failed");
  }
  
}

-(void)addApp:(NSString *)path {
  [self addApp: path
      withName: [self nameForApp: path]];
}

-(void)restartApp:(NSString *)name {
  NSFileManager *filemgr;
  
  NSString *path = [[self pathForApp: name] stringByAppendingPathComponent: @"tmp/restart.txt"];
  filemgr = [NSFileManager defaultManager];
  
  [filemgr setAttributes: [NSDictionary dictionaryWithObject: [NSDate date]
                                                      forKey: NSFileModificationDate]
            ofItemAtPath: path
                   error: nil];
}

-(void)deleteApp:(NSString *)name {
  NSFileManager *filemgr;
  
  filemgr = [NSFileManager defaultManager];
  
  if ([filemgr removeItemAtPath: [self installationPathForApp: name]
                          error: NULL]  == YES) {
    NSLog(@"Remove successful");
  } else {
    NSLog(@"Remove failed");
  }
}

-(NSString *)pathForAppFromInstallationPath: (NSString *)path {
  return [path stringByResolvingSymlinksInPath];
}
-(NSString *)pathForApp:(NSString *)name {
  return [self pathForAppFromInstallationPath: [self installationPathForApp: name]];
}

- (NSString *)installationPath {
  return [NSHomeDirectory() stringByAppendingPathComponent: @".pow/"];
}

- (NSString *)installationPathForApp:(NSString *)name {
  return [[self installationPath] stringByAppendingPathComponent: name];
}

-(void)dealloc {
  [list release];
}

@end
