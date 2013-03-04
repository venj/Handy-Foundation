//
//  NSWindow+HFExtension.h
//  Handy Foundation
//
//  Created by 朱 文杰 on 13-3-3.
//  Copyright (c) 2013年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSWindow (HFExtension)
- (void)resizeTo:(NSSize)newSize display:(BOOL)display animated:(BOOL)animated;
- (void)resizeTo:(NSSize)newSize;
@end
