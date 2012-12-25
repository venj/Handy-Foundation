//
//  HandyFoundation.m
//  Handy Foundation
//
//  Created by 朱 文杰 on 12-2-21.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "HandyFoundation.h"

# pragma mark NSArray Catagory 
@implementation NSArray (HandyFoundation)
// Syntactic Sugar
- (NSUInteger) size {
    return [self count];
}

- (NSUInteger) length {
    return [self count];
}

- (id)firstObject {
    if ([self count] == 0) {
        return nil; //Return nil here. 
    }
    return [self objectAtIndex:0];
}

- (NSString *)join:(NSString *)linkString {
    NSMutableString *tmp = [[NSMutableString alloc] init];
    [tmp appendString:[self objectAtIndex:0]];
    for (NSInteger i = 1; i < [self count]; i++) {
        id e = [self objectAtIndex:i];
        if (![e isKindOfClass:[NSString class]]) {
            return nil;
        }
        [tmp appendFormat:@"%@%@", linkString, e];
    }
    return tmp;
}

@end
# pragma mark -

# pragma mark NSString Catagory 
@implementation NSString (HandyFoundation)
// Syntactic Sugar
- (NSString *)toUpper {
    return [self uppercaseString];
}

- (NSString *)toLower {
    return [self lowercaseString];
}

- (NSString *)upCase {
    return [self uppercaseString];
}

- (NSString *)downCase {
    return [self lowercaseString];
}

- (NSString *)capitalize {
    return [self capitalizedString];
}

- (NSUInteger)size {
    return [self length];
}

- (NSUInteger)count {
    return [self length];
}

- (NSArray *)split:(NSString *)separator {
    return [self split:separator rule:HFSplitRuleAny];
}

- (NSString *)baseName {
    return [self lastPathComponent];
}

// Enhancement.
- (NSArray *)split:(NSString *)separator rule:(HFSplitRule)rule {
    switch (rule) {
        case HFSplitRuleWhole:
            return [self componentsSeparatedByString:separator];
        case HFSplitRuleAny:
        default: {
            NSCharacterSet *separators = [NSCharacterSet characterSetWithCharactersInString:separator];
            return [self componentsSeparatedByCharactersInSet:separators];
        }
    }
}

- (BOOL)isBlank {
    if ([self length] == 0) {
        return YES;
    }
    else {
        return [[self strip] length] == 0;
    }
}

- (NSString *)baseNameWithoutExtension {
    if ([[self pathExtension] isEqualToString:@""]) {
        return [self lastPathComponent];
    }
    else {
        NSString *ext = [self pathExtension];
        NSString *baseName = [self lastPathComponent];
        return [baseName substringToIndex:([baseName length] - [ext length] - 1)];
    }
}

- (NSString *)dirName {
    NSMutableArray *components = [[self pathComponents] mutableCopy];
    [components removeLastObject];
    NSString *dirName = [NSString pathWithComponents:components];
    return dirName;
}

- (NSString *)charStringAtIndex:(NSUInteger)index {
    return [self substringWithRange:NSMakeRange(index, 1)];
}

- (NSString *)strip {
    NSCharacterSet *whiteSpaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:whiteSpaces];
}

- (NSString *)lstrip {
    NSString *strippedString = [self strip];
    return [NSString stringWithFormat:@"%@%@", strippedString, [[self componentsSeparatedByString:strippedString] lastObject]];
}

- (NSString *)rstrip {
    NSString *strippedString = [self strip];
    return [NSString stringWithFormat:@"%@%@", [[self componentsSeparatedByString:strippedString] firstObject] , strippedString];
}

@end
# pragma mark -

# pragma mark NSMutableString
@implementation NSMutableString (HandyFoundation)


@end

@implementation NSDictionary (HandyFoundation)
- (NSString *)requestString {
    NSMutableArray *tmpArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (id key in [self allKeys]) {
        if ([key isKindOfClass:[NSString class]]) {
            NSString *kv = [NSString stringWithFormat:@"%@=%@", key, [self objectForKey:key]];
            [tmpArray addObject:[kv stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
        else {
            return nil;
        }
    }
    return [tmpArray join:@"&"];
}

- (NSData *)requestData {
    return [[self requestString] dataUsingEncoding:NSUTF8StringEncoding];
}
@end

