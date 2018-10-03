//
//  NSString+SMFWordCount.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "NSString+SMFWordCount.h"

@implementation NSString (SMFWordCount)

- (int)wordCount {
    
    NSArray *wordArray = [self componentsSeparatedByString:@" "];
    return (int)wordArray.count;
    
}

@end
