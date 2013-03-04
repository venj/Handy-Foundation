//
//  NSWindow+HFExtension.m
//  Handy Foundation
//
//  Created by 朱 文杰 on 13-3-3.
//  Copyright (c) 2013年 Home. All rights reserved.
//

#import "NSWindow+HFExtension.h"

@implementation NSWindow (HFExtension)

- (void)resizeTo:(NSSize)newSize display:(BOOL)display animated:(BOOL)animated {
    CGRect oldFrame = self.frame;
    CGRect newFrame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y - (newSize.height - oldFrame.size.height), newSize.width, newSize.height);
    [self setFrame:newFrame display:display animate:animated];
}

- (void)resizeTo:(NSSize)newSize {
    [self resizeTo:newSize display:YES animated:YES];
}

@end
