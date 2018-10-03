//
//  SMFDocument.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFDocument.h"
#import "NSString+SMFWordCount.h"

@implementation SMFDocument

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body {
    
    self = [super init];
    if (self) {
        _title = title;
        _body = body;
    }
    return self;
}

-(int)wordCount {
    return self.body.wordCount;
}

@end
