//
//  NSWindow+HFExtension.h
//  Handy Foundation
//
//  Created by 朱 文杰 on 13-3-3.
//  Copyright (c) 2013年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/** Convinent methods for NSWindow.  */

@interface NSWindow (HFExtension)

/**
 This method is used to resize a window gracefully.
 
 Because of Cocoa's coordinator is originated from bottom-left corner, 
 so if only changes window's frame's width and height to resize the window 
 will move the title bar, which is a bad idea.
 
 This method can resize the window while keep the top left corner of the window
 fixed, while animate the width and/or height of the window.
 
 @param newSize A `NSSize` struct to set the size of the window to be resized.
 @param display Specifies whether the window redraws the views that need to be displayed. When `YES` the window sends a displayIfNeeded message down its view hierarchy, thus redrawing all views.
 @param animated Specifies whether the window performs a smooth resize. YES to perform the animation, whose duration is specified by `NSWindow`'s`animationResizeTime:`.
 
 @see resizeTo:
 */
- (void)resizeTo:(NSSize)newSize display:(BOOL)display animated:(BOOL)animated;

/** This is a convinent method for resizeTo:display:animated: with `display` and `animated` set to `YES`.
 
 @param newSize A `NSSize` struct to set the size of the window to be resized.
 
 @see resizeTo:display:animated:
 */
- (void)resizeTo:(NSSize)newSize;

@end
