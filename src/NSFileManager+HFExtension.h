//
//  NSFileManager+HFExtension.h
//  Handy Foundation
//
//  Created by venj on 13-2-25.
//  Copyright (c) 2013年 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (HFExtension)
- (NSURL *)userDocumentDirectory;
- (NSURL *)userLibraryDirectory;
- (NSURL *)userCacheDirectory;
@end
