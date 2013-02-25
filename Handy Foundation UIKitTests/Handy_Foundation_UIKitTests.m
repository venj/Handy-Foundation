//
//  Handy_Foundation_UIKitTests.m
//  Handy Foundation UIKitTests
//
//  Created by 朱 文杰 on 12-3-7.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "Handy_Foundation_UIKitTests.h"
#import "HandyFoundation+UIKit.h"

@implementation Handy_Foundation_UIKitTests

- (void)testNSFileManagerUserDir {
    NSString *home = NSHomeDirectory();
    NSFileManager *fm = [NSFileManager defaultManager];
    
    STAssertEqualObjects([NSURL fileURLWithPath:[home stringByAppendingPathComponent:@"Documents"]], [fm userDocumentDirectory], @"User document directory is not set correctly.");
    STAssertEqualObjects([NSURL fileURLWithPath:[home stringByAppendingPathComponent:@"Library"]], [fm userLibraryDirectory], @"User library directory is not set correctly.");
    STAssertEqualObjects([NSURL fileURLWithPath:[[home stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]], [fm userCacheDirectory], @"User caches directory is not set correctly.");
}

@end
