//
//  Handy_Foundation_LogicTests.m
//  Handy Foundation LogicTests
//
//  Created by 朱 文杰 on 12-2-22.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "Handy_Foundation_LogicTests.h"
#import "HandyFoundation+AppKit.h"

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

- (void)testNSStringSplit {
    NSString *origString = @"This is . a simple, and dumb,. text . nun-sense ;for testing. ";
    NSUInteger count;
    
    count = [[origString split:@",."] count];
    STAssertEquals(count, (NSUInteger)7,@"Expect return an array with 7 members, but get %lu", count);
    count = [[origString split:@",." rule:HFSplitRuleWhole] count];
    STAssertEquals(count, (NSUInteger)2,@"Expect return an array with 2 members, but get %lu.", count);
    count = [[origString split:@",." rule:HFSplitRuleAny] count];
    STAssertEquals(count, (NSUInteger)7,@"Expect return an array with 7 members, but get %lu.", count);
    
    count = [[origString split:@",.;"] count];
    STAssertEquals(count, (NSUInteger)8,@"Expect return an array with 8 members, but get %lu.", count);
    count = [[origString split:@",.;" rule:HFSplitRuleWhole] count];
    STAssertEquals(count, (NSUInteger)1,@"Expect return an array with 1 members, but get %lu.", count);
    count = [[origString split:@",.;" rule:HFSplitRuleAny] count];
    STAssertEquals(count, (NSUInteger)8,@"Expect return an array with 8 members, but get %lu.", count);
}

- (void)testNSStringPathOperations {
    NSString *path = @"/System/Library/Extensions/SomeExtension.kext";
    
    NSString *basename = [path baseName];
    STAssertEqualObjects(basename, @"SomeExtension.kext", @"Expect SomeExtension.kext, but get %@", basename);
    
    basename = [path baseNameWithExtension:NO];
    STAssertEqualObjects(basename, @"SomeExtension", @"Expect SomeExtensiont, but get %@", basename);
    
    NSString *dirname = [path dirName];
    STAssertEqualObjects(dirname, @"/System/Library/Extensions", @"Expect /System/Library/Extensions, but get %@", dirname);
}

- (void)testNSStringCharStringAtIndex {
    NSString *origString = @"The Quick Brown Fox Jumps Over The Lazy Dog";
    NSString *charString = [origString charStringAtIndex:1];
    STAssertEqualObjects(charString, @"h", @"Expect 'h', but get '%@'", charString);
}

- (void)testNSStringBlankString {
    NSString *emptyString =  @"";
    NSString *blankString = @" \n \t \t \n ";
    NSString *nonBlankString = @".";
    
    STAssertTrue([emptyString isBlank], @"Expect YES, but get %@", ([emptyString isBlank] ? @"YES" : @"NO"));
    STAssertTrue([blankString isBlank], @"Expect YES, but get %@", ([blankString isBlank] ? @"YES" : @"NO"));
    STAssertFalse([nonBlankString isBlank], @"Expect NO, but get %@", ([nonBlankString isBlank] ? @"YES" : @"NO"));
}

- (void)testNSStringStrip {
    NSString *origString = @" \n \tThis is a \n really boring \t string \t \n ";
    
    NSString *strippedString = [origString strip];
    STAssertEqualObjects(strippedString, @"This is a \n really boring \t string", @"Expected string not match, get %@", strippedString);
    
    strippedString = [origString lstrip];
    STAssertEqualObjects(strippedString, @"This is a \n really boring \t string \t \n ", @"Expected string not match, get %@", strippedString);
    
    strippedString = [origString rstrip];
    STAssertEqualObjects(strippedString, @" \n \tThis is a \n really boring \t string", @"Expected string not match, get %@", strippedString);
}


@end
