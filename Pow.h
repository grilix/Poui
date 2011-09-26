//
//  Pow.h
//  Poui
//
//  Created by Gonzalo Arreche on 2011-09-25.
//  Copyright 2011 Moove-iT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pow : NSObject {
  NSArray *list;
}

-(NSArray *)appList;
-(void)reloadAppList;
-(void)addApp: (NSString *)path;
-(void)addApp: (NSString *)path withName: (NSString *)name;
-(void)restartApp: (NSString *)name;
-(void)deleteApp: (NSString *)name;
-(NSString *)nameForApp: (NSString *)path;
-(NSString *)pathForApp: (NSString *)name;
-(NSString *)pathForAppFromInstallationPath: (NSString *)path;
-(NSString *)installationPath;
-(NSString *)installationPathForApp: (NSString *)name;

@end
