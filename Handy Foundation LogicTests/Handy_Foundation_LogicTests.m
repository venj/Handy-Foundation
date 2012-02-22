//
//  Handy_Foundation_LogicTests.m
//  Handy Foundation LogicTests
//
//  Created by 朱 文杰 on 12-2-22.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "Handy_Foundation_LogicTests.h"
#import "HandyFoundation.h"

@implementation Handy_Foundation_LogicTests

- (void)setUp
{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

- (void)testNSArrayCountAliases {
    NSArray *array = [NSArray array];
    STAssertEquals([array length], [array count], @"Expect %lu for empty array length.", [array count]);
    STAssertEquals([array size], [array count], @"Expect %lu for empty array size.", [array count]);
    array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    STAssertEquals([array length], [array count], @"Expect %lu for array length.", [array count]);
    STAssertEquals([array size], [array count], @"Expect %lu for array size.", [array count]);
}

- (void)testNSArrayForFirstObject {
    NSArray *array = [NSArray array];
    STAssertNil([array firstObject], @"Expect nil for empty array length.");
    array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    STAssertEqualObjects([array firstObject], @"1", @"Expect '1' for array length.");
}

- (void)testNSStringCaseConversion {
    NSString *origString = @"tHe qUiCK BroWn FoX JumPs oVEr tHE LaZY dOG";
    STAssertEqualObjects([origString downCase], @"the quick brown fox jumps over the lazy dog", @"Expect downCase to work correctly.");
    STAssertEqualObjects([origString toLower], @"the quick brown fox jumps over the lazy dog", @"Expect toLower to work correctly.");
    STAssertEqualObjects([origString upCase], @"THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG", @"Expect upCase to work correctly.");
    STAssertEqualObjects([origString toUpper], @"THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG", @"Expect toUpper to work correctly.");
    STAssertEqualObjects([origString capitalize], @"The Quick Brown Fox Jumps Over The Lazy Dog", @"Expect capitalize to work correctly.");
}

- (void)testNSStringLengthAliases {
    NSString *origString = @"tHe qUiCK BroWn FoX JumPs oVEr tHE LaZY dOG";
    STAssertEquals([origString size], [origString length], @"Expect %lu for string size.", [origString length]);
    STAssertEquals([origString count], [origString length], @"Expect %lu for string char count.", [origString length]);
}

@end
