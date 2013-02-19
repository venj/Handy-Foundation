//
//  NSArray+HFExtension.h
//  Handy Foundation
//
//  Created by venj on 13-2-19.
//  Copyright (c) 2013年 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HFExtension)
- (NSUInteger) size;
- (NSUInteger) length;
- (id)firstObject;
- (NSString *)join:(NSString *)linkString;
@end
